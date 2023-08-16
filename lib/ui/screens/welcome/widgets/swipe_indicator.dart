import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_color.dart';

class SwipeIndicator extends StatelessWidget {
  final bool isActive;
  final Color activeColor;
  final double? height;
  final double? width;

  const SwipeIndicator(
      {super.key,
      required this.isActive,
      this.activeColor = AppColor.introIndicatorGreen,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: height ?? 2.h,
      width: width ?? 68.h,
      decoration: BoxDecoration(
        color: isActive ? activeColor : AppColor.darkGray,
        borderRadius: isActive
            ? const BorderRadius.all(Radius.circular(5))
            : const BorderRadius.all(Radius.circular(5)),
        shape: BoxShape.rectangle,
      ),
    );
  }
}
