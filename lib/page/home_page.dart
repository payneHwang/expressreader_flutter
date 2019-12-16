import 'package:expressreader_flutter/page/magazine/magazine_page.dart';
import 'package:expressreader_flutter/page/mine/mine_page.dart';
import 'package:expressreader_flutter/page/news/news_page.dart';
import 'package:expressreader_flutter/page/travel/travel_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///首页
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //当前所在位置
  int _currentPosition = 0;

  //内容组件
  List<StatefulWidget> _tabBarViews;

  @override
  void initState() {
    _tabBarViews = [NewsPage(), TravelPage(), MagazinePage(), MinePage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigatorBar(),
    );
  }

  Widget _buildBody() {
    return Center(child: _tabBarViews[_currentPosition]);
  }

  Widget _buildBottomNavigatorBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.library_books,
            size: 24,
          ),
          title: Text("快讯"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.airplanemode_active,
            size: 24,
          ),
          title: Text("旅游"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.book,
            size: 24,
          ),
          title: Text("杂志"),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 24,
          ),
          title: Text("我的"),
        ),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentPosition,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      onTap: (int position) {
        setState(() {
          _currentPosition = position;
        });
      },
    );
  }
}
