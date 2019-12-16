import 'package:expressreader_flutter/page/home_page.dart';
import 'package:expressreader_flutter/page/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///ExpressReader Flutter客户端

void main() => runApp(ExpressReader());

class ExpressReader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SplashPage(),
      routes: {
        "/home": (context) => HomePage(),
      },
    );
  }
}
