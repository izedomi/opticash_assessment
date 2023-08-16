import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voip/app/services/password_validator_service.dart';
import 'package:voip/ui/utils/media_query.dart';

import '../../../utils/app_color.dart';
import '../../../utils/space.dart';
import 'password_strength_indicator.dart';

class StrengthIndicator extends StatefulWidget {
  final ValidatorStatus validatorStatus;
  const StrengthIndicator({super.key, required this.validatorStatus});

  @override
  State<StrengthIndicator> createState() => _StrengthIndicatorState();
}

class _StrengthIndicatorState extends State<StrengthIndicator> {
  Color color = AppColor.darkGray;

  @override
  Widget build(BuildContext context) {
    if (widget.validatorStatus.strengthStatus == "weak") {
      color = AppColor.statusRed;
    }
    if (widget.validatorStatus.strengthStatus == "medium") {
      color = AppColor.pendingOrange;
    }
    if (widget.validatorStatus.strengthStatus == "strong") {
      color = AppColor.introIndicatorGreen;
    }

    return SizedBox(
      width: deviceWidth(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          PasswordStrengthIndicator(
            activeColor: color,
            width: 18.w,
            height: 4.h,
            status: widget.validatorStatus,
          ),
          HSpace(4.w),
          PasswordStrengthIndicator(
            activeColor: color,
            width: 18.w,
            height: 4.h,
            status: widget.validatorStatus,
          ),
          HSpace(4.w),
          PasswordStrengthIndicator(
            activeColor: color,
            width: 18.w,
            height: 4.h,
            status: widget.validatorStatus,
          ),
          HSpace(4.w),
          PasswordStrengthIndicator(
            activeColor: color,
            width: 18.w,
            height: 4.h,
            status: widget.validatorStatus,
          ),
          HSpace(6.w),
          Text(
            widget.validatorStatus.strengthStatus,
            style: TextStyle(
                color: color, fontSize: 8.sp, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
