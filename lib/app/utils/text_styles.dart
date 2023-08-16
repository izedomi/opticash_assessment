import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opticash/app/constants/font_family.dart';

import '../../ui/utils/app_color.dart';

class TextStyles {
  static TextStyle onboardingLabel = TextStyle(
      color: AppColor.fomoGreen, fontSize: 30.sp, fontWeight: FontWeight.w600);

  static TextStyle onboardingSubLabel = TextStyle(
      color: AppColor.fomoGrey,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: poppins,
      height: 1.3);
}
