import 'package:flutter/cupertino.dart';

///闪屏页面
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    //展示2s之后跳转到首页
    _pendingToHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Positioned(
          child: Image.asset(
            "assets/image/expressreader_splash_slogan.png",
            fit: BoxFit.fitWidth,
            width: 225,
          ),
          top: 150,
        ),
        Positioned(
          child: Image.asset(
            "assets/image/expressreader_splash_copyright.png",
            fit: BoxFit.fitWidth,
            width: 185,
          ),
          bottom: 10,
        )
      ],
    );
  }

  void _pendingToHomePage() {
    Future.delayed(
        Duration(
          seconds: 2,
        ), () {
      Navigator.pushReplacementNamed(context, "/home");
    });
  }
}
