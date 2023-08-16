// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_color.dart';

class BsHeader extends StatelessWidget {
  const BsHeader(
      {Key? key,
      required this.navTitle,
      this.rightIconWidget,
      this.titleFontSize,
      this.titleColor})
      : super(key: key);

  final String navTitle;
  final Widget? rightIconWidget;

  final double? titleFontSize;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Flexible(
        //   flex: 1,
        //   child: InkWell(
        //     onTap: leftIconTap,
        //     child: const Padding(
        //         padding: EdgeInsets.all(4.0), child: Icon(Icons.close)),
        //   ),
        // ),
        Flexible(
          flex: 10,
          child: Text(navTitle,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColor.brandBlack,
                fontSize: 16.sp,
              )

              // style: TextStyle(
              //   fontSize: titleFontSize ?? 20,
              //   fontWeight: FontWeight.w600,
              //   color: AppColors.defaultBlue2,
              //   overflow: TextOverflow.ellipsis,
              // ),
              ),
        ),
        Flexible(
          flex: 2,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Text(
              "Close",
              style: TextStyle(
                  fontSize: 15.h, color: AppColor.brandBlack.withOpacity(0.6)),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
