import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_color.dart';

class PINInputBox extends StatefulWidget {
  final String codeInput;

  const PINInputBox({
    Key? key,
    required this.codeInput,
  }) : super(key: key);

  @override
  State<PINInputBox> createState() => _PINInputBoxState();
}

class _PINInputBoxState extends State<PINInputBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.w,
      height: 12.w,
      decoration: BoxDecoration(
        color:
            widget.codeInput.isEmpty ? AppColor.fomoGrey : AppColor.fomoGreen,
        shape: BoxShape.circle,
      ),
    );
  }
}
