import 'package:expressreader_flutter/config/color_config.dart';
import 'package:expressreader_flutter/config/style_config.dart';
import 'package:expressreader_flutter/module/bean/magazine_issue.dart';
import 'package:expressreader_flutter/module/bean/magazine_review.dart';
import 'package:expressreader_flutter/module/repository/magazine_factory.dart';
import 'package:expressreader_flutter/tools/date_util.dart';
import 'package:expressreader_flutter/widgets/indicator_progress.dart';
import 'package:expressreader_flutter/widgets/magazine_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MagazineUnitPage extends StatefulWidget {
  String _issueId;

  String _brandCode;

  String lcid;

  MagazineUnitPage(this._issueId, this._brandCode, this.lcid);

  @override
  _MagazineUnitPageState createState() => _MagazineUnitPageState();
}

class _MagazineUnitPageState extends State<MagazineUnitPage> {
  MagazineIssue _mazIssue;

  //往期杂志列表
  List<ReviewList> _mazReviewList;

  //总页数
  int _pageTotal = 1;

  //往期杂志分页索引
  int pgInd = 1;

  @override
  void initState() {
    _getMagazineUnit(0);
    _getMagazineReview();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      endDrawer: _buildDrawer(),
    );
  }

  void _getMagazineUnit(int turn) {
    MagazineFactory.getMazUnit(
            widget._issueId, widget._brandCode, turn, widget.lcid)
        .then((json) {
      Map<String, dynamic> mapJson = json["data"];
      if (mapJson != null) {
        _mazIssue = MagazineIssue.fromJson(mapJson);
        _rebuild();
      }
    }, onError: (e) {
      print("_getMagazineUnit onError >>> $e");
    });
  }

  void _getMagazineReview() {
    MagazineFactory.getMazReview(widget._brandCode, pgInd, 20, widget.lcid)
        .then((json) {
      Map<String, dynamic> mapJson = json["data"];
      if (mapJson != null) {
        MagazineReview review = MagazineReview.fromJson(mapJson);
        if (review != null) {
          _mazReviewList = review.xList;
          _pageTotal = review.pageTotal;
        }
        _rebuild();
      }
    }, onError: (e) {
      print("_getMagazineReview onError >>> $e");
    });
  }

  void _rebuild() {
    setState(() {
      print("_rebuild >>> ");
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: 0,
      title: Text(
        "ELLE 1832期",
        style: StyleConfig.newsTitleStyle,
      ),
    );
  }

  Widget _buildBody() {
    return _mazIssue == null
        ? IndicatorProgress()
        : ListView(
            padding: EdgeInsets.all(15),
            children: <Widget>[
              Container(
                alignment: AlignmentDirectional.bottomCenter,
                height: MediaQuery.of(context).size.width + 92,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_mazIssue.cover),
                  ),
                ),
                child: Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: <Color>[
                      Color.fromRGBO(0, 0, 0, 0),
                      Color.fromRGBO(0, 0, 0, 0.69),
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  height: 60,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${_mazIssue.mgName} ${_mazIssue.issueNo}期",
                              style: StyleConfig.newsTitleStyle
                                  .copyWith(fontSize: 20, color: Colors.white),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Text(
                                DateUtil.getFormatDate(_mazIssue.pubDate, ""),
                                style: StyleConfig.newsNormalStyle.copyWith(
                                    fontSize: 13, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: ColorConfig.colorPrimary,
                        ),
                        child: Text(
                          "整本阅读",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 109,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.6,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: MagazineCard(
                      _mazIssue.pageList[index],
                    ),
                  );
                },
              )
            ],
          );
  }

  Drawer _buildDrawer() {
    return Drawer(
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
        itemCount: _mazReviewList == null ? 0 : _mazReviewList.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 80,
            crossAxisSpacing: 25,
            mainAxisSpacing: 10,
            childAspectRatio: 0.5),
        itemBuilder: (context, position) {
          ReviewList reviewItem = _mazReviewList[position];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.network(reviewItem.cover),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  "${reviewItem.issueNo} 期",
                  style: StyleConfig.newsNormalStyle.copyWith(fontSize: 14),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
