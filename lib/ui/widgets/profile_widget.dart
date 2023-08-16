import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/constants/png_image_asset.dart';
import '../utils/app_color.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget(
      {super.key,
      this.width,
      this.firstName,
      this.fullName,
      this.filePhoto,
      this.profilePhoto});
  final double? width;
  final String? firstName;
  final String? fullName;
  final String? profilePhoto;
  final String? filePhoto;
  @override
  Widget build(BuildContext context) {
    double w = width ?? 36.w;
    double radius = (w / 2);
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        width: width,
        height: width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.white,
        ),
        child: filePhoto != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Container(
                    width: w,
                    height: w,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.file(
                      File(filePhoto!),
                      fit: BoxFit.cover,
                    )),
              )
            : profilePhoto == null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(radius),
                    child: Container(
                        width: w,
                        height: w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          PngImageAsset.profileDefault,
                          fit: BoxFit.cover,
                        )),
                  )
                : Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(radius),
                      child: CachedNetworkImage(
                        imageUrl: profilePhoto!,
                        width: w,
                        height: w,
                        fit: BoxFit.cover,
                        fadeInDuration: const Duration(milliseconds: 2000),
                        // placeholder: (context, url) => Text(
                        //   AppUtils.getInitialsFromFullname(fullName ?? ""),
                        //   style: TextStyle(
                        //       color: AppColor.brandBlue,
                        //       fontSize: 14.sp,
                        //       fontWeight: FontWeight.w500),
                        // ),
                        placeholder: (context, url) {
                          return Image.asset(PngImageAsset.profileDefault);
                        },
                        errorWidget: (context, url, error) {
                          return Image.asset(PngImageAsset.profileDefault);
                        },
                      ),
                    ),
                    //child: Image.asset(PngImageAsset.chinedu
                  ),
      ),
    );
  }
}
