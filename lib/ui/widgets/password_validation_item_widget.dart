import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_color.dart';
import '../utils/space.dart';

class PasswordValidationItemWidget extends StatelessWidget {
  final String label;
  final bool isValid;
  const PasswordValidationItemWidget(this.label, this.isValid, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 15.w,
          height: 15.w,
          //padding: EdgeInsets.all(1.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: isValid
                  ? AppColor.brandGreen
                  : AppColor.brandGreen.withOpacity(0.3)),
          child: const Icon(Icons.check, size: 10, color: AppColor.white),
        ),
        HSpace(8.w),
        Text(label,
            style: TextStyle(
                color: AppColor.black.withOpacity(0.6),
                fontSize: 13.sp,
                fontWeight: FontWeight.w400))
      ],
    );
  }
}
