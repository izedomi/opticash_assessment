import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opticash/app/constants/png_image_asset.dart';
import 'package:opticash/app/routes/routes.dart';
import 'package:opticash/ui/utils/app_color.dart';
import 'package:opticash/ui/utils/media_query.dart';
import 'package:opticash/ui/utils/space.dart';

import '../../../app/services/page_switcher_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double waveOpacity = 0;
  double logoOpacity = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  init() async {
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        logoOpacity = 1;
      });
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        waveOpacity = 1;
      });
    });
    _switchPage();
  }

  _switchPage() async {
    PageSwitcherService(context).switchPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: deviceWidth(context),
          height: deviceHeight(context),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                // bottom: 0,
                // left: 0,
                // right: 0,
                child: AnimatedOpacity(
                  opacity: waveOpacity,
                  duration: const Duration(milliseconds: 1000),
                  child: Image.asset(
                    PngImageAsset.wave,
                    width: deviceWidth(context),
                    height: deviceHeight(context) / 2.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  opacity: logoOpacity,
                  duration: const Duration(milliseconds: 1000),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      VSpace(36.h),
                      Image.asset(
                        PngImageAsset.logo,
                        width: 109.w,
                        height: 128.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
