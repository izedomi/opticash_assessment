import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:opticash/app/constants/png_image_asset.dart';
import 'package:opticash/app/routes/routes.dart';
import 'package:opticash/app/vm/home_vm.dart';
import 'package:opticash/ui/utils/flushbar.dart';
import '../../../app/constants/globals.dart';
import '../../../app/models/signin_response.dart';
import '../../../app/services/storage_service.dart';
import '../../utils/app_color.dart';
import '../../utils/media_query.dart';
import '../../utils/space.dart';
import '../../widgets/pattern_money.dart';
import '../../widgets/profile_widget.dart';
import 'widget/keypad/pin_input.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  String fullName = "";
  init() async {
    User? authUser = await StorageService.getUser();
    setState(() {
      if (authUser != null) {
        fullName = "${authUser.firstName} ${authUser.lastName}";
        Provider.of<UserVM>(context, listen: false).setCurrentUser(authUser);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.only(
            left: 24.w,
            right: 24.w,
          ),
          margin: EdgeInsets.only(
            top: 12.h,
          ),
          height: deviceHeight(context),
          width: deviceWidth(context),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(cRadius),
                  topRight: Radius.circular(cRadius))),
          child: Stack(
            children: [
              const PatternMoneyBg(),
              ListView(
                children: [
                  VSpace(32.h),
                  Align(
                      alignment: Alignment.center,
                      child: ProfileCardWidget(width: 72.w, profilePhoto: url)),
                  VSpace(12.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Welcome back",
                      style: TextStyle(
                          color: AppColor.wiBlack,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  VSpace(4.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      fullName,
                      style: TextStyle(
                          color: AppColor.wiBlack,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  VSpace(16.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Enter your PIN to continue\n(Valid PIn: 1234)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1.4,
                          color: AppColor.black.withOpacity(0.7),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  VSpace(12.sp),
                  TransactionPIN(
                      onSubmit: (String pin) {
                        _verifyTransactionPin(pin);
                      },
                      onBioAuthenticate: () {}),
                ],
              ),
            ],
          ),
        ));
  }

  _verifyTransactionPin(String pin) async {
    pin == "1234"
        ? _gotoNextScreen(HomeRoute.home)
        : Flush.toast(message: "Invalid pin");
  }

  _gotoNextScreen(String path) {
    Navigator.pushNamedAndRemoveUntil(context, path, (r) => false);
  }
}
