import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle textStyle(double size,
      {FontWeight weight = FontWeight.w400}) {
    return TextStyle(fontSize: size.sp, fontWeight: weight);
  }

  static TextStyle style34 = textStyle(34);
  static TextStyle style20 = textStyle(20);
  static TextStyle style18 = textStyle(18);
  static TextStyle style16 = textStyle(16);
  static TextStyle style14 = textStyle(14);
  static TextStyle style12 = textStyle(12);
  static TextStyle style10 = textStyle(10);
  static TextStyle style9 = textStyle(9);
  static TextStyle style8 = textStyle(8);
  static TextStyle style6 = textStyle(6);
}
