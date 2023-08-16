import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:voip/app/vm/home_vm.dart';
import 'package:voip/ui/shared/bs/bs_wrapper.dart';
import 'package:voip/ui/shared/bs/content/logout_bs.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/space.dart';

import 'number_pad.dart';
import 'pin_input_box.dart';

class TransactionPIN extends StatefulWidget {
  final Function(String pin) onSubmit;
  final Function() onBioAuthenticate;

  const TransactionPIN(
      {Key? key, required this.onSubmit, required this.onBioAuthenticate})
      : super(key: key);

  @override
  State<TransactionPIN> createState() => _TransactionPINState();
}

class _TransactionPINState extends State<TransactionPIN> {
  late Size size;
  String pinCode = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Consumer<UserVM>(builder: (context, vm, _) {
      return Container(
        width: size.width,
        height: size.height * 0.6,
        color: Colors.transparent,
        child: SizedBox(
          height: size.height * 0.6,
          child: Column(children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                PINInputBox(
                  codeInput: pinCode.isNotEmpty ? pinCode.substring(0, 1) : '',
                ),
                SizedBox(width: 24.w),
                PINInputBox(
                  codeInput: pinCode.length > 1 ? pinCode.substring(1, 2) : '',
                ),
                SizedBox(width: 24.w),
                PINInputBox(
                  codeInput: pinCode.length > 2 ? pinCode.substring(2, 3) : '',
                ),
                SizedBox(width: 24.w),
                PINInputBox(
                  codeInput: pinCode.length > 3 ? pinCode.substring(0, 1) : '',
                ),
              ])
            ]),
            VSpace(24.h),
            SizedBox(
                child: Column(children: [
              NumberPad(
                onNumberSelected: (value) {
                  setState(() {
                    if (value != -1) {
                      if (pinCode.length < 4) {
                        pinCode = pinCode + value.toString();
                      }
                    } else {
                      if (pinCode.isNotEmpty) {
                        pinCode = pinCode.substring(0, pinCode.length - 1);
                      }
                    }
                  });
                  if (pinCode.length == 4) {
                    widget.onSubmit(pinCode);
                    pinCode = "";
                  }
                },
                onBioAuthenticate: widget.onBioAuthenticate,
              ),
              VSpace(24.h),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        BsWrapper.bottomSheet(
                            context: context,
                            widget: LogoutBs(onLogout: () {
                              Provider.of<UserVM>(context, listen: false)
                                  .logout();
                            }));
                      },
                      child: Text(
                        "Sign Out",
                        style: TextStyle(
                            color: AppColor.kayGreen,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ]),
              VSpace(16.h),
            ]))
          ]),
        ),
      );
    });
  }
}
