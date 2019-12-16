import 'package:expressreader_flutter/config/color_config.dart';
import 'package:expressreader_flutter/config/style_config.dart';
import 'package:expressreader_flutter/page/travel/travel_type_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///旅游页面
class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = new TabController(length: 2, vsync: this);
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
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 15),
        child: Image.asset(
          "assets/image/expressreader_ctml_logo.png",
          width: 30,
        ),
      ),
      title: TabBar(
        isScrollable: true,
        labelColor: ColorConfig.colorPrimary,
        labelStyle: StyleConfig.tabBarStyle,
        unselectedLabelColor: Colors.white70,
        indicatorWeight: 2,
        indicatorColor: ColorConfig.colorPrimary,
        indicatorPadding: EdgeInsets.only(bottom: 2),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: <Widget>[Tab(text: "澳门"), Tab(text: "大陆")],
        controller: _tabController,
      ),
    );
  }

  Widget _buildBody() {
    return TabBarView(
        controller: _tabController,
        children: <Widget>[TravelTypePage("1028"), TravelTypePage("2052")]);
  }
}
