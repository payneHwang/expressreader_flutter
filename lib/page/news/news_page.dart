import 'package:expressreader_flutter/config/color_config.dart';
import 'package:expressreader_flutter/config/style_config.dart';
import 'package:expressreader_flutter/module/bean/tab_bean.dart';
import 'package:expressreader_flutter/page/news/news_type_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///快讯页面
class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with TickerProviderStateMixin {
  //tab数组
  List<TabBean> _tabBeans;

  //控制器
  TabController _tabController;

  @override
  void initState() {
    _tabBeans = [TabBean("澳门", "1028"), TabBean("大陆", "2052")];

    _tabController = TabController(vsync: this, length: _tabBeans.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  @override
  void dispose() {
    if (_tabController != null) {
      _tabController.dispose();
    }
    super.dispose();
  }

  Widget _buildAppBar() {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Image.asset(
          "assets/image/expressreader_ctml_logo.png",
          width: 30,
          fit: BoxFit.fitWidth,
        ),
      ),
      title: TabBar(
        tabs: <Widget>[Tab(text: "澳门"), Tab(text: "大陆")],
        isScrollable: true,
        unselectedLabelColor: Colors.white70,
        labelColor: ColorConfig.colorPrimary,
        labelStyle: StyleConfig.tabBarStyle,
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: ColorConfig.colorPrimary,
        indicatorPadding: EdgeInsets.only(bottom: 2),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildBody() {
    return TabBarView(
      children: <Widget>[
        NewsTabBarView("5124"),
        NewsTabBarView("2052"),
      ],
      controller: _tabController,
    );
  }
}
