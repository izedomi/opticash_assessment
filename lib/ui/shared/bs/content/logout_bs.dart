import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../../../app/vm/home_vm.dart';
import '../../../utils/app_color.dart';
import '../../../utils/space.dart';
import '../../../widgets/button_widgets.dart';

class LogoutBs extends StatefulWidget {
  final Function() onLogout;

  const LogoutBs({
    Key? key,
    required this.onLogout,
  }) : super(key: key);

  @override
  State<LogoutBs> createState() => _LogoutBsState();
}

class _LogoutBsState extends State<LogoutBs> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 16.h, bottom: 56.h, left: 24.w, right: 24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Text(
                "Close",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColor.brandBlack.withOpacity(0.6)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          mainContent()
        ],
      ),
    );
  }

  Widget mainContent() {
    return Consumer<UserVM>(builder: (context, vm, _) {
      return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Align(
            child: Icon(
          Iconsax.logout,
          size: 60,
          color: AppColor.kayGreen,
        )),
        VSpace(20.h),
        Text("${vm.user?.firstName ?? ""}, are you sure you want to sign out?",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17.sp)),
        VSpace(24.h),
        ButtonWidgets().customButton(
            context: context,
            buttonColor: AppColor.dialogBtnColor,
            buttonTextColor: AppColor.white,
            buttonText: "Cancel",
            function: () {
              Navigator.pop(context);
            }),
        VSpace(16.h),
        InkWell(
          onTap: widget.onLogout,
          child: Text("Yes, Sign me out",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17.sp,
                  color: AppColor.dialogBtnColor)),
        ),
      ]);
    });
  }
}
