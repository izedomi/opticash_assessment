import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_color.dart';
import '../../../utils/space.dart';

class OtherActionWidget extends StatelessWidget {
  final String label1;
  final String label2;
  final Function() onTap;
  const OtherActionWidget(
      {super.key,
      required this.label1,
      required this.label2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label1,
            style: TextStyle(
                color: AppColor.fomoGrey,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400)),
        HSpace(6.w),
        InkWell(
          onTap: onTap,
          child: Text(label2,
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColor.fomoGreen,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
