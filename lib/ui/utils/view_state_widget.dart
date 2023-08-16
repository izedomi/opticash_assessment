import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:opticash/ui/utils/space.dart';
import '../../app/constants/lottie_image_asset.dart';
import '../widgets/button_widgets.dart';
import 'app_color.dart';

class ViewStateWidget {
  static loader() {
    return const Center(
      child: SizedBox(
          width: 40, height: 40, child: CircularProgressIndicator.adaptive()),
    );
  }

  static Widget busy({double? verticalspacing}) {
    return Column(
      mainAxisAlignment: verticalspacing != null
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      children: [
        VSpace(verticalspacing ?? 0),
        AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInExpo,
          width: 100.w,
          height: 100.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.brandGreen),
          ),
          child: SizedBox(
              width: 125.w,
              height: 125.w,
              child: Lottie.asset(LottieAsset.walkingMan)),
        ),
      ],
    );
  }

  static error({
    required BuildContext context,
    required String errMsg,
    required Function() onPressed,
    double? verticalspacing,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: verticalspacing != null
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          VSpace(verticalspacing ?? 0),
          // Lottie.asset(LImageAsset.error2,
          //     fit: BoxFit.fill, width: 120.w, height: 120.h),
          Text(
            "...we are sorry",
            style: TextStyle(
                color: AppColor.black.withOpacity(0.8),
                fontSize: 20.sp,
                fontWeight: FontWeight.w600),
          ),
          VSpace(16.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(errMsg,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColor.gray)),
          ),
          SizedBox(
            height: 24.h,
          ),
          ButtonWidgets().customButton(
              context: context,
              function: onPressed,
              buttonWidth: 180.w,
              buttonText: "Retry",
              buttonColor: AppColor.black)
        ],
      ),
    );
  }

  static error2({
    required BuildContext context,
    required String errMsg,
    required Function() onPressed,
    double? verticalspacing,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: verticalspacing != null
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          VSpace(verticalspacing ?? 0),
          Text(
            "...we are sorry",
            style: TextStyle(
                color: AppColor.brandGreen,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600),
          ),
          VSpace(16.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(errMsg,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColor.black)),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextButton(
              onPressed: onPressed,
              child: const Text(
                "Retry",
                style: TextStyle(color: AppColor.brandGreen),
              )),
          // ButtonWidgets().customButton(
          //     context: context,
          //     function: onPressed,
          //     buttonWidth: 180.w,
          //     buttonText: "Retry",
          //     buttonColor: AppColor.brandBlue)
        ],
      ),
    );
  }

  static empty({
    required String label,
    required String subLabel,
    double? verticalSpacing,
  }) {
    return Center(
        child: Column(children: [
      VSpace(verticalSpacing ?? 229.h),
      // Image.asset(
      //   image,
      //   width: 100.w,
      //   height: 100.w,
      // ),
      VSpace(16.h),
      Align(
          alignment: Alignment.center,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColor.black.withOpacity(0.8),
                fontSize: 20.sp,
                fontWeight: FontWeight.w600),
          )),
      VSpace(8.h),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(subLabel,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColor.black)),
      ),
    ]));
  }
}
