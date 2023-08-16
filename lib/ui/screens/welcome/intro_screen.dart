import 'dart:async';
import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voip/app/constants/png_image_asset.dart';
import 'package:voip/ui/screens/welcome/widgets/swipe_indicator.dart';
import 'package:voip/ui/utils/app_color.dart';
import 'package:voip/ui/utils/media_query.dart';

import '../../../app/routes/routes.dart';
import '../../utils/space.dart';
import '../../widgets/button_widgets.dart';

class IntroText {
  String label;
  String subLabel;

  IntroText(this.label, this.subLabel);
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  Timer? _timer;
  double opacity = 1;

  List intro = <IntroText>[
    IntroText("Send Money faster\nthan you imagined",
        "Opticash provides you the fastest remittance to send and receive money!"),
    IntroText("A guarantted secured payment",
        "Opticash provides you the safest remittance to send and receive money!"),
    IntroText("Borderless payment at your finger tips",
        "Opticash provides you the a secure remittance to send and receive money!"),
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  void startTimer() {
    Duration oneSec = const Duration(milliseconds: 1000);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          opacity = opacity == 1 ? 0 : 1;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.black,
      body: Container(
        width: deviceWidth(context),
        height: deviceHeight(context),
        color: AppColor.black,
        child: Stack(
          children: [
            Positioned(
              top: 150.h,
              // bottom: 0,
              left: 0,
              right: 40.w,
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 2000),
                  child: Image.asset(
                    PngImageAsset.singleWave1,
                    color: AppColor.darkBrown,
                    width: 419.5.w,
                    height: 328.5.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 170.h,
              // bottom: 0,
              left: 0,
              right: 50.w,
              child: AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 2000),
                child: Image.asset(
                  PngImageAsset.singleWave2,
                  color: AppColor.darkBrown,
                  width: 421.w,
                  height: 306.56.h,

                  // height: deviceHeight(context) / 2.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //pattern image
            Positioned(
              top: 0,
              // bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: opacity,
                duration: const Duration(milliseconds: 1000),
                child: Image.asset(
                  PngImageAsset.pattern,
                  // width: deviceWidth(context),
                  // height: deviceHeight(context) / 2.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              top: 80.h,
              // bottom: 0,
              left: 24.w,
              // right: 0,
              child: Image.asset(
                PngImageAsset.onboarding,
                width: 324.w,
                height: 294.h,
                fit: BoxFit.cover,
              ),
            ),

            Swiper(
              autoplay: true,
              autoplayDisableOnInteraction: true,
              autoplayDelay: 3000,
              itemBuilder: (BuildContext context, int index) {
                return const SizedBox();
              },
              itemCount: 3,
              onIndexChanged: (index) {
                onIndexChanged(index);
              },
            ),
            Positioned(
                left: 16.w,
                right: 16.w,
                bottom: 46.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VSpace(45.h),
                    Text(
                      intro[currentIndex].label,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          height: 1.1,
                          color: AppColor.white,
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    VSpace(8.h),
                    Text(
                      intro[currentIndex].subLabel,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          height: 1.3,
                          color: AppColor.mercuryGray,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    VSpace(37.h),
                    SizedBox(
                      width: deviceWidth(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          SwipeIndicator(
                            isActive: currentIndex == 0,
                          ),
                          HSpace(8.w),
                          SwipeIndicator(
                            isActive: currentIndex == 1,
                          ),
                          HSpace(8.w),
                          SwipeIndicator(
                            isActive: currentIndex == 2,
                          )
                        ],
                      ),
                    ),
                    VSpace(30.h),
                    ButtonWidgets().gradientButton(
                        context: context,
                        buttonColor: AppColor.brandGreen,
                        buttonText: "Create New Account",
                        buttonTextSize: 16.sp,
                        function: () {
                          Navigator.pushNamed(
                              context, AuthOnboardingRoute.signup);
                        }),
                    VSpace(13.h),
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, AuthOnboardingRoute.sigin),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Sign In",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              height: 1.3,
                              decoration: TextDecoration.underline,
                              color: AppColor.white,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    VSpace(38.h),
                    if (Platform.isAndroid)
                      Align(
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 5.h,
                          width: 134.w,
                          decoration: const BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  onIndexChanged(int index) {
    if (currentIndex <= 2) {
      setState(() {
        currentIndex = index;
        //changeOpacity();
      });
    } else {
      currentIndex = 0;
    }
  }
}
