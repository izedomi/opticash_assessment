import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/space.dart';
import 'number_key.dart';

class NumberPad extends StatelessWidget {
  final Function(int) onNumberSelected;
  final Function() onBioAuthenticate;

  const NumberPad(
      {Key? key,
      required this.onNumberSelected,
      required this.onBioAuthenticate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      alignment: Alignment.bottomCenter,
      constraints: const BoxConstraints(
          // maxHeight: Sizes.dimen_400,
          ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NumberKey(number: 1, onNumberSelected: onNumberSelected),
                    NumberKey(number: 2, onNumberSelected: onNumberSelected),
                    NumberKey(number: 3, onNumberSelected: onNumberSelected),
                  ]),
            ),
            VSpace(12.h),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NumberKey(number: 4, onNumberSelected: onNumberSelected),
                    NumberKey(number: 5, onNumberSelected: onNumberSelected),
                    NumberKey(number: 6, onNumberSelected: onNumberSelected),
                  ]),
            ),
            VSpace(12.h),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NumberKey(number: 7, onNumberSelected: onNumberSelected),
                    NumberKey(number: 8, onNumberSelected: onNumberSelected),
                    NumberKey(number: 9, onNumberSelected: onNumberSelected),
                  ]),
            ),
            VSpace(12.h),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      // child: InkWell(
                      //   onTap: onBioAuthenticate,
                      //   child: Container(
                      //     width: 70.w,
                      //     height: 70.w,
                      //     alignment: Alignment.center,
                      //     decoration: const BoxDecoration(
                      //       color: AppColor.brandGreen,
                      //       shape: BoxShape.circle,
                      //     ),
                      //     child: Image.asset(
                      //       PngImageAsset.faceId,
                      //       width: 32.w,
                      //       height: 32.w,
                      //     ),
                      //     // constraints: BoxConstraints(
                      //     //   maxWidth: 100,
                      //     //   maxHeight: 100,
                      //     // ),
                      //   ),
                      // ),
                      child: SizedBox(),
                    ),
                    NumberKey(number: 0, onNumberSelected: onNumberSelected),
                    backSpace()
                  ]),
            ),
          ]),
    );
  }

  backSpace() {
    return Expanded(
        child: GestureDetector(
      onTap: () => onNumberSelected(-1),
      child: Container(
          width: 70.w,
          height: 70.w,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Iconsax.close_square,
            color: AppColor.kayGreen,
            size: 40,
          )),
    ));
  }
}
