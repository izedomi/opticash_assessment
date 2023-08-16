import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:voip/app/vm/home_vm.dart';
import 'package:voip/ui/utils/app_color.dart';
import 'package:voip/ui/utils/media_query.dart';
import 'package:voip/ui/widgets/busy_overlay.dart';
import '../../widgets/pattern_money.dart';

class CardTab extends StatefulWidget {
  const CardTab({super.key});

  @override
  State<CardTab> createState() => _CardTabState();
}

class _CardTabState extends State<CardTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserVM>(builder: (context, vm, _) {
      return BusyOverlay(
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: SizedBox(
            width: deviceWidth(context),
            height: deviceHeight(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      const PatternMoneyBg(),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        top: 0,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Card",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    height: 1.4.h,
                                    fontSize: 24.sp,
                                    color: AppColor.dialogBtnColor,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Text("coming soon...",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    height: 1.4.h,
                                    fontSize: 15.sp,
                                    color: AppColor.fomoGrey,
                                    fontWeight: FontWeight.w400,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
