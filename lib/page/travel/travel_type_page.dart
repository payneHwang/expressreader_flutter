import 'package:expressreader_flutter/module/bean/travel_brand.dart';
import 'package:expressreader_flutter/module/repository/travel_factory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TravelTypePage extends StatefulWidget {
  final String lcid;

  TravelTypePage(this.lcid);

  @override
  _TravelTypePageState createState() => _TravelTypePageState();
}

class _TravelTypePageState extends State<TravelTypePage> {
  int _pgInd = 1;

  //当前总页数
  int _pageTotal = 1;

  //图书目录
  List<TravelBrandList> _travelBookList;

  @override
  void initState() {
//    _getTravelBrand();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(15),
        itemCount: _travelBookList == null ? 0 : _travelBookList.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 225,
            mainAxisSpacing: 20,
            childAspectRatio: 0.57,
            crossAxisSpacing: 20),
        itemBuilder: (BuildContext context, int position) {
          TravelBrandList brand = _travelBookList[position];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network(
                brand.coverPath,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  brand.bookName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              )
            ],
          );
        });
  }

  void _getTravelBrand() {
    TravelFactory.getTravelBrand("5124", _pgInd, 30).then((json) {
      print("_getTravelBrand json >>> $json");
      Map<String, dynamic> mapJson = json["data"];
      TravelBrand brand = TravelBrand.fromJson(mapJson);
      if (brand != null) {
        _pageTotal = brand.pageTotal;
        _travelBookList = brand.xList;
        _rebuild();
      }
    }, onError: (e) {
      print("_getTravelBrand onError >>> $e");
    }).catchError((error) {
      print("_getTravelBrand onError >>> $error");
    });
  }

  void _rebuild() {
    setState(() {
      print("_rebuild >>> ");
    });
  }
}
