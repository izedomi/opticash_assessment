import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNav {
  String path;
  String name;
  String activePath;
  double? width = 25.w;
  double? height = 25.w;
  BottomNav(
      {required this.path,
      required this.activePath,
      required this.name,
      this.width,
      this.height});
}
