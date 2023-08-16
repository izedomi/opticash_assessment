import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:opticash/app/vm/home_vm.dart';
import 'package:opticash/ui/utils/app_color.dart';
import 'package:opticash/ui/utils/media_query.dart';
import 'package:opticash/ui/widgets/busy_overlay.dart';
import '../../widgets/pattern_money.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({super.key});

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
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
                              Text("Account",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    height: 1.4.h,
                                    fontSize: 24.sp,
                                    color: AppColor.dialogBtnColor,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Text("it will be revoluntionary...",
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
