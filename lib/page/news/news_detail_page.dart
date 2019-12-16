import 'package:expressreader_flutter/config/style_config.dart';
import 'package:expressreader_flutter/module/bean/news.dart';
import 'package:expressreader_flutter/module/bean/news_detail.dart';
import 'package:expressreader_flutter/module/repository/news_factory.dart';
import 'package:expressreader_flutter/widgets/indicator_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPage extends StatefulWidget {
  final NewsList newsList;

  NewsDetailPage(this.newsList);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  //新闻详情链接
  NewsDetail _newsDetail;

  @override
  void initState() {
    if (widget.newsList.sourceType == 0) {
      //请求内容
      _getNewsDetail();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: -8,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: Image.network(
              widget.newsList.newsLogoImg,
              width: 20,
            ),
          ),
          Text(
            widget.newsList.newsName,
            style: StyleConfig.newsTitleStyle,
          )
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.font_download),
          color: Colors.white,
          onPressed: () {
            //TODO 弹出字体弹出框
          },
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.white,
          onPressed: () {
            //TODO 收藏
          },
        ),
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            Share.share(_getShareLink());
          },
        )
      ],
    );
  }

  Widget _buildBody() {
    if (widget.newsList.sourceType == 1) {
      return WebView(
        initialUrl: widget.newsList.sourceUrl,
//        initialUrl: "https://www.baidu.com/",
        onPageFinished: (result) {
          print("onPageFinished result  >>> $result");
        },
        onPageStarted: (started) {
          print("onPageStarted started  >>> $started");
        },
        onWebViewCreated: (WebViewController controller) {
          print("onPageStarted started  >>> ${controller.toString()}");
        },
      );
    } else {
      return _newsDetail == null
          ? Center(
              child: IndicatorProgress(),
            )
          : WebView(
              initialUrl: _getShareLink(),
//              initialUrl: "https://www.baidu.com/",
              onPageFinished: (result) {
                print("onPageFinished result  >>> $result");
              },
              onPageStarted: (started) {
                print("onPageStarted started  >>> $started");
              },
              onWebViewCreated: (WebViewController controller) {
                print("onPageStarted started  >>> ${controller.toString()}");
              },
            );
    }
  }

  void _getNewsDetail() {
    NewsFactory.getNewsDetail(
            "${widget.newsList.lcid}", widget.newsList.newsUnitId)
        .then((json) {
      print("_getNewsDetail json >>> $json");
      if (json != null) {
        Map<String, dynamic> mapJson = json["data"];
        if (mapJson != null) {
          _newsDetail = NewsDetail.fromJson(mapJson);
          _rebuild();
        }
      }
    }, onError: (e) {
      print("_getNewsDetail onError >>> $e");
    });
  }

  void _rebuild() {
    setState(() {
      print("_rebuild >>> ${_newsDetail.htmlContext}");
    });
  }

  String _getShareLink() {
    return _newsDetail.shareLink +
        "api/v1/express/share?newsUnitId=${_newsDetail.newsUnitId}&lcid=${_newsDetail.lcid}&a=02 ";
  }
}
