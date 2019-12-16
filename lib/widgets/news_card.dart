import 'package:expressreader_flutter/config/color_config.dart';
import 'package:expressreader_flutter/config/style_config.dart';
import 'package:expressreader_flutter/module/bean/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsCard extends StatelessWidget {
  //数据bean
  final NewsList newsItem;

  NewsCard(this.newsItem);

  @override
  Widget build(BuildContext context) {
    return _getChild(context);
  }

  Widget _getChild(BuildContext context) {
    if (newsItem == null) {
      return Container();
    } else {
      int styleType = newsItem.styleType;
      switch (styleType) {
        case 1: //一图模式
          return _oneType(context);
        case 3: //3图模式
          return _threeType();
      }
      //无图模式
      return _noneType();
    }
  }

  Widget _oneType(context) {
    return new Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: BoxDecoration(
          border: Border(
              bottom: Divider.createBorderSide(
        context,
        color: ColorConfig.colorDivider,
        width: 0.1,
      ))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  newsItem.newsTitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: StyleConfig.newsTitleStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Visibility(
                      visible: newsItem.tagInfo == 1001,
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(2),
                          ),
                          border: Border.all(
                              color: ColorConfig.newsTagTextColor, width: 1.0),
                        ),
                        child: Text(
                          "置顶",
                          style: StyleConfig.newsTagStyle,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20,
                      child: Image.network(
                        newsItem.newsLogoImg,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text(
                        newsItem.newsName,
                        style: StyleConfig.newsNormalStyle,
                      ),
                    ),
                    Text(
                      "1分钟前",
                      style: StyleConfig.newsNormalStyle,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Image.network(
              newsItem.newsImages[0],
              width: 120,
            ),
          )
        ],
      ),
    );
  }

  Widget _noneType() {
    return new Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              newsItem.newsTitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: StyleConfig.newsTitleStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: newsItem.tagInfo == 1001,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorConfig.newsTagTextColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  child: Text(
                    "置顶",
                    style: StyleConfig.newsTagStyle,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.network(
                  newsItem.newsLogoImg,
                  width: 20,
                  height: 20,
                ),
                radius: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  newsItem.newsName,
                  style: StyleConfig.newsNormalStyle,
                ),
              ),
              Text(
                "1秒前",
                style: StyleConfig.newsNormalStyle,
              ),
            ],
          ),
          Container(
            color: ColorConfig.colorDivider,
            margin: EdgeInsets.only(top: 10),
            height: 0.1,
          )
        ],
      ),
    );
  }

  Widget _threeType() {
    return new Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            newsItem.newsTitle,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: StyleConfig.newsTitleStyle,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//                Image.network(newsItem.newsImages[0]),
//                Image.network(newsItem.newsImages[1]),
//                Image.network(newsItem.newsImages[2]),
                Expanded(
                  child: Image.network(newsItem.newsImages[0]),
                ),
                Padding(padding: EdgeInsets.only(right: 9)),
                Expanded(
                  child: Image.network(newsItem.newsImages[1]),
                ),
                Padding(padding: EdgeInsets.only(right: 9)),
                Expanded(
                  child: Image.network(newsItem.newsImages[2]),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: newsItem.tagInfo == 1001,
                child: Container(
                  padding: EdgeInsets.only(right: 14),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorConfig.newsTagTextColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                  child: Text(
                    "置顶",
                    style: StyleConfig.newsTagStyle,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Image.network(
                  newsItem.newsLogoImg,
                  width: 20,
                  height: 20,
                ),
                radius: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7),
                child: Text(
                  newsItem.newsName,
                  style: StyleConfig.newsNormalStyle,
                ),
              ),
              Text(
                "1秒前",
                style: StyleConfig.newsNormalStyle,
              ),
            ],
          ),
          Container(
            color: ColorConfig.colorDivider,
            margin: EdgeInsets.only(top: 10),
            height: 0.1,
          )
        ],
      ),
    );
  }
}
