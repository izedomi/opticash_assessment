import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:opticash/ui/utils/space.dart';
import '../../main.dart';
import 'app_color.dart';

class Flush {
  static toast(
      {required String message,
      Color? textColor,
      Color? backgroundColor,
      int? duration,
      FlushbarPosition? position}) {
    return Flushbar<dynamic>(
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.information5,
            color: AppColor.mercuryWhite,
            size: 24.w,
          ),
          HSpace(8.w),
          Flexible(
            child: Text(
              message,
              maxLines: 2,
              style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: AppColor.mercuryWhite,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor ?? AppColor.kayGreen.withOpacity(0.7),
      borderRadius: BorderRadius.circular(5.r),
      flushbarPosition: position ?? FlushbarPosition.TOP,
      margin: EdgeInsets.only(
        left: 20.h,
        bottom: 20.h,
        right: 12.w,
      ),
      duration: Duration(seconds: duration ?? 3),
    ).show(navigatorKey.currentContext!);
  }
}
