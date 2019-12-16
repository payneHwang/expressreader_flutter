import 'package:expressreader_flutter/module/bean/news.dart';
import 'package:expressreader_flutter/module/repository/news_factory.dart';
import 'package:expressreader_flutter/page/news/news_detail_page.dart';
import 'package:expressreader_flutter/widgets/news_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsTabBarView extends StatefulWidget {
  final String lcid;

  NewsTabBarView(this.lcid);

  @override
  _NewsTabBarViewState createState() => _NewsTabBarViewState();
}

class _NewsTabBarViewState extends State<NewsTabBarView> {
  //当前总页数
  int _pageTotal = 1;

  //品牌列表
  List<NewsList> _newsList;

  //当前页面索引
  int _pdInd = 1;

  //构造假数据
  @override
  void initState() {
    _getExpressNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        itemCount: _newsList == null ? 0 : _newsList.length,
        itemBuilder: (BuildContext context, int position) {
          NewsList newsList = _newsList[position];
          return InkWell(
            onTap: () {
              print("navigator to NewsDetailPage >>> ");
              //跳转新闻详情页面
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsDetailPage(newsList)));
            },
            child: NewsCard(
              newsList,
            ),
          );
        });
  }

  void _getExpressNews() async {
    print("_getExpressNews start ... ");
    NewsFactory.getExpressNews(widget.lcid, _pdInd, 50, "0").then((value) {
      print("_getExpressNews json >>> $value");
      Map<String, dynamic> jsonMap = value['data'];
      News news = News.fromJson(jsonMap);
      if (news != null) {
        _pageTotal = news.pageTotal;
        _newsList = news.xList;
        print("_getExpressNews _pageTotal >>> $_pageTotal");
        print("_getExpressNews _newsList.size >>> ${_newsList.length}");
        _rebuild();
      }
    }, onError: (error) {
      print("_getExpressNews error >>> $error");
    }).catchError((err) {
      print(err.toString());
    });
  }

  void _rebuild() {
    setState(() {
      print("_rebuild >>> ");
    });
  }
}
