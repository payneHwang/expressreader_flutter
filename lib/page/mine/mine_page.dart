import 'package:expressreader_flutter/config/color_config.dart';
import 'package:expressreader_flutter/config/style_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///我的页面
class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  //当前用户的状态
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildUserHeader(),
        _buildDivider(),
        _buildOptions(Icons.star, "我的收藏", () {}),
        _buildOptions(Icons.access_time, "阅读历史", () {}),
        _buildDivider(),
        _buildOptions(Icons.security, "激活会员", () {}),
        _buildDivider(),
        _buildOptions(Icons.supervised_user_circle, "关于我们", () {}),
        _buildOptions(Icons.info, "当前版本", () {}, tail: "v2.1"),
      ],
    );
  }

  Widget _buildUserHeader() {
    return isLogin
        ? Container()
        : InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "登录/注册",
                      style: StyleConfig.newsTitleStyle
                          .copyWith(fontSize: 26, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "立即登錄，解鎖更多應用功能",
                    style: StyleConfig.newsNormalStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
            ),
          );
  }

  Widget _buildDivider() {
    return Container(
      height: 10,
      color: Colors.white10,
    );
  }

  Widget _buildOptions(IconData icon, String text, Function onTap,
      {String tail}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 6),
              child: Icon(
                icon,
                size: 20,
                color: ColorConfig.colorPrimary,
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: StyleConfig.newsNormalStyle,
              ),
            ),
            tail == null
                ? Icon(
                    Icons.chevron_right,
                    size: 22,
                    color: Colors.grey,
                  )
                : Text(tail)
          ],
        ),
      ),
    );
  }
}
