import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class TextStyleUtil {
  TextStyle homeTabWhiteBoldX = TextStyle(
      fontSize: ScreenUtil().setWidth(45.0),
      fontWeight: FontWeight.bold,
      color: Colors.white);

  TextStyle homeTabWhiteBoldXX = TextStyle(
      fontSize: ScreenUtil().setWidth(47.0),
      fontWeight: FontWeight.bold,
      color: Colors.white);

  TextStyle homeTabWhiteX = TextStyle(
      fontSize: ScreenUtil().setWidth(34.0),
//      fontWeight: FontWeight.bold,
      color: Colors.white);

  TextStyle homeAdvertisementX = TextStyle(
      fontSize: ScreenUtil().setWidth(34.0),
//      fontWeight: FontWeight.bold,
      color: Colors.grey[800]);

  ///书架item 书名
  TextStyle homeBookShelfX = TextStyle(
      fontSize: ScreenUtil().setWidth(34.0),
//      fontWeight: FontWeight.bold,
      color: Colors.black);

  ///书架item 已读或作者
  TextStyle homeBookShelfL = TextStyle(
      fontSize: ScreenUtil().setWidth(32.0),
//      fontWeight: FontWeight.bold,
      color: Colors.grey[800]);
}
