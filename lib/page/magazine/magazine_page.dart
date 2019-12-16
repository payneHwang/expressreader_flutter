import 'package:expressreader_flutter/config/color_config.dart';
import 'package:expressreader_flutter/config/style_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'magazine_type_page.dart';

///杂志页面
class MagazinePage extends StatefulWidget {
  @override
  _MagazinePageState createState() => _MagazinePageState();
}

class _MagazinePageState extends State<MagazinePage>
    with TickerProviderStateMixin {
  //tabBar控制器
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    if (_tabController != null) {
      _tabController.dispose();
    }
    super.dispose();
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
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Image.asset(
          "assets/image/expressreader_ctml_logo.png",
          width: 30,
          fit: BoxFit.fitWidth,
        ),
      ),
      title: TabBar(
        isScrollable: true,
        labelColor: ColorConfig.colorPrimary,
        labelStyle: StyleConfig.tabBarStyle,
        unselectedLabelColor: Colors.white70,
        indicatorColor: ColorConfig.colorPrimary,
        indicatorWeight: 2,
        indicatorSize: TabBarIndicatorSize.label,
        controller: _tabController,
        indicatorPadding: EdgeInsets.only(bottom: 2),
        tabs: <Widget>[
          Tab(
            text: "澳门",
          ),
          Tab(
            text: "大陆",
          )
        ],
      ),
    );
  }

  Widget _buildBody() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        MagazineTabType("5124"),
        MagazineTabType("2052"),
      ],
    );
  }
}
