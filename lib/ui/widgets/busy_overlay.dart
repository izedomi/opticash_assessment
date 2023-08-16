import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:opticash/app/constants/png_image_asset.dart';
import 'package:opticash/ui/helpers/ripple_effect.dart';
import '../utils/app_color.dart';
import '../utils/space.dart';

class BusyOverlay extends StatefulWidget {
  final Widget child;
  final Widget? secondaryChild;
  final String? title;
  final bool show;
  final Color? bgColor;

  const BusyOverlay(
      {super.key,
      required this.child,
      this.secondaryChild,
      this.title,
      this.bgColor,
      this.show = false});

  @override
  State<BusyOverlay> createState() => _BusyOverlayState();
}

class _BusyOverlayState extends State<BusyOverlay> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Material(
        child: Stack(children: <Widget>[
      widget.child,
      IgnorePointer(
        ignoring: !widget.show,
        child: Visibility(
            visible: widget.show,
            child: Container(
              width: screenSize.width,
              height: screenSize.height,
              alignment: Alignment.center,
              color: widget.bgColor ?? AppColor.black.withOpacity(0.7),
              child: widget.secondaryChild ??
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Ripple(
                          rippleColor: AppColor.brandGreen,
                          width: 150.w,
                          child: Image.asset(
                            PngImageAsset.logo,
                            width: 100.w,
                            height: 100.w,
                          )),
                      VSpace(8.h),
                      Text(widget.title ?? "",
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
            )),
      ),
    ]));
  }
}
