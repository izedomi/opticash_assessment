import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_color.dart';

class NumberKey extends StatelessWidget {
  final int number;
  final Function(int) onNumberSelected;

  const NumberKey({
    Key? key,
    required this.number,
    required this.onNumberSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () => onNumberSelected(number),
      child: Container(
          width: 70.w,
          height: 70.w,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColor.kayGreen,
            shape: BoxShape.circle,
          ),
          // constraints: BoxConstraints(
          //   maxWidth: 100,
          //   maxHeight: 100,
          // ),
          child: Center(
              child: Text(number.toString(),
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w400)))),
    ));
  }
}
