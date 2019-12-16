import 'package:expressreader_flutter/module/bean/magazine_brand.dart';
import 'package:expressreader_flutter/module/repository/magazine_factory.dart';
import 'package:expressreader_flutter/tools/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'magazine_unit.dart';

class MagazineTabType extends StatefulWidget {
  final String lcid;

  MagazineTabType(this.lcid);

  @override
  _MagazineTabTypeState createState() => _MagazineTabTypeState();
}

class _MagazineTabTypeState extends State<MagazineTabType> {
  //当前页数
  int _pgInd = 1;

  //当前总页数
  int _pageTotal = 1;

  //当前品牌列表
  List<MagazineList> _mazBrandList;

  @override
  void initState() {
    _getMazBrand();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
        itemCount: _mazBrandList == null ? 0 : _mazBrandList.length,
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 225,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 0.8),
        itemBuilder: (BuildContext context, int position) {
          MagazineList brand = _mazBrandList[position];
          return InkWell(
            onTap: () {
              //跳转杂志单元列表
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MagazineUnitPage(
                      brand.lastIssue[0].issueId, brand.brandCode,widget.lcid),
                ),
              );
            },
            child: Container(
              alignment: AlignmentDirectional.bottomCenter,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: new NetworkImage(brand.lastIssue[0].cover),
                    fit: BoxFit.cover),
              ),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color.fromRGBO(0, 0, 0, 0),
                      Color.fromRGBO(0, 0, 0, 0.69),
                    ],
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 10, 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              brand.magzName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 16),
                            ),
                            Text(
                              DateUtil.getFormatDate(
                                  brand.lastIssue[0].pubDate, ""),
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    Checkbox(
                      onChanged: (bool checked) {
                        _onMazChanged(checked);
                      },
                      value: brand.isFocus == 0,
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _getMazBrand() {
    MagazineFactory.getMazBrand(widget.lcid, _pgInd, 30).then((json) {
      print("_getMazBrand  result>>> $json");
      Map<String, dynamic> mapJson = json["data"];
      if (mapJson != null) {
        MagazineBrandBean bean = MagazineBrandBean.fromJson(mapJson);
        if (bean != null) {
          _pageTotal = bean.pageTotal;
          _mazBrandList = bean.xList;
          _rebuild();
        }
      }
    }, onError: (error) {
      print("_getMazBrand error>>> $error");
    }).catchError((error) {
      print("_getMazBrand catchError>>> $error");
    });
  }

  void _rebuild() {
    setState(() {
      print("_rebuild >>> ");
    });
  }

  _onMazChanged(bool value) {
    Fluttertoast.showToast(msg: value ? "收藏成功" : "取消收藏");
  }
}
