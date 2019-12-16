import 'package:expressreader_flutter/config/color_config.dart';
import 'package:flutter/material.dart';

///风格配置
class StyleConfig {
  static bool dark = true;
  static ThemeData themeData = new ThemeData.dark();
  static Color searchBackgroundColor = Colors.white10;
  static Color cardBackgroundColor = new Color(0xFF222222);
  static Color fontColor = Colors.white30;

  //Tab标题样式
  static final TextStyle tabBarStyle =
      TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.w700);

  //新闻标题样式
  static final TextStyle newsTitleStyle = TextStyle(
      color: ColorConfig.titleTextColor,
      fontSize: 19,
      letterSpacing: 0.2,
      fontWeight: FontWeight.w500);

//新闻提示文字样式
  static final TextStyle newsNormalStyle = TextStyle(
      color: ColorConfig.hintTextColor,
      fontSize: 16,
      letterSpacing: 0.2,
      fontWeight: FontWeight.w500);

  //新闻提示文字样式
  static final TextStyle newsTagStyle = TextStyle(
      color: ColorConfig.newsTagTextColor,
      fontSize: 13,
      letterSpacing: 0.2,
      fontWeight: FontWeight.w300);
}
