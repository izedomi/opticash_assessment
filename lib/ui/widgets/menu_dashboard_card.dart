// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voip/app/constants/font_family.dart';
import '../../app/constants/png_image_asset.dart';
import '../utils/app_color.dart';
import '../utils/space.dart';

class MenuDashboardCard extends StatelessWidget {
  final double? width;
  final String img;
  final String label;
  final Color bgColor;

  const MenuDashboardCard(
      {Key? key,
      this.width,
      required this.img,
      required this.label,
      required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width ?? 261.w,
        //height: 134.h,
        padding: EdgeInsets.symmetric(horizontal: 17.r),
        margin: EdgeInsets.only(right: 10.w),
        decoration: BoxDecoration(
          color: bgColor,
          image: const DecorationImage(
            image: AssetImage(PngImageAsset.menuDashboardLayer),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          children: [
            Image.asset(
              img,
              width: 88.w,
              height: 88.w,
            ),
            HSpace(15.w),
            Flexible(
                child: Text(
              label,
              style: TextStyle(
                  fontFamily: poppins,
                  height: 1.4,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.white),
            ))
          ],
        ));
  }
}
