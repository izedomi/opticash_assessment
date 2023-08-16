import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/services/password_validator_service.dart';
import '../../../utils/app_color.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final Color activeColor;
  final double? height;
  final double? width;
  final ValidatorStatus status;

  const PasswordStrengthIndicator(
      {super.key,
      this.activeColor = AppColor.introIndicatorGreen,
      this.height,
      required this.status,
      this.width});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: height ?? 2.h,
      width: width ?? 68.h,
      decoration: BoxDecoration(
        color: activeColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        shape: BoxShape.rectangle,
      ),
    );
  }
}
