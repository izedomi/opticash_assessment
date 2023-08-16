import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import '../../app/enum/keyboard_type.dart';
import '../utils/app_color.dart';
import '../utils/textfield_utils.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final String? optionalText;
  final TextEditingController controller;
  final Function? onChange;
  final bool? isPassword;
  final bool? isConfirmPassword;
  final bool? showSuffixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final String? errorText;
  final KeyboardType keyboardType;
  final double? width;
  final double? height;
  final bool? isReadOnly;
  final FocusNode? focusNode;
  final bool showLabelHeader;
  final Color? labelColor;
  final double? labelSize;
  final bool isOptional;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final Function()? onTap;

  const CustomTextField(
      {Key? key,
      required this.labelText,
      this.hintText,
      this.optionalText,
      this.labelColor,
      this.labelSize,
      required this.controller,
      this.isPassword = false,
      this.isConfirmPassword = false,
      this.showSuffixIcon = false,
      this.suffixIcon,
      this.prefix,
      this.errorText,
      this.width,
      this.height,
      this.isReadOnly = false,
      this.keyboardType = KeyboardType.regular,
      this.showLabelHeader = true,
      this.focusNode,
      this.isOptional = false,
      this.onChange,
      this.labelStyle,
      this.hintStyle,
      this.onTap})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;
  double radius = 8.r;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: widget.width ?? double.infinity,
          // height: widget.height ?? 54.h,
          height: 60.h,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 34.h),
          padding: EdgeInsets.only(top: 6.h, left: 8.w),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(color: AppColor.fomoGrey),
          ),

          child: Row(
            children: [
              widget.prefix == null
                  ? const SizedBox.shrink()
                  : Container(
                      padding: EdgeInsets.only(
                        left: 4.w,
                        right: 10.w,
                      ),
                      child: widget.prefix,
                    ),
              Expanded(
                child: TextField(
                  //cursorHeight: 14.sp,
                  cursorColor: AppColor.black,
                  focusNode: widget.focusNode,

                  style: TextStyle(
                      color: const Color(0xff273240),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                  controller: widget.controller,
                  obscureText: widget.isPassword! && !showPassword,
                  obscuringCharacter: "⚫️".toString().substring(0, 1),
                  keyboardType: inputType(widget.keyboardType),
                  inputFormatters: inputFormatter(widget.keyboardType),
                  onChanged: (String value) {
                    if (widget.onChange != null) {
                      widget.onChange!();
                    }
                  },
                  onTap: widget.onTap,
                  readOnly: widget.isReadOnly!,
                  decoration: InputDecoration(
                    errorText: widget.errorText,
                    errorStyle: TextStyle(
                        color: AppColor.black, fontSize: 0.01.sp, height: 0.2),
                    hintText: widget.hintText,
                    hintStyle: widget.hintStyle ??
                        TextStyle(
                          color: widget.labelColor ?? AppColor.gray,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(radius),
                    ),
                  ),
                ),
              ),
              widget.showSuffixIcon!
                  ? Container(
                      padding: EdgeInsets.only(
                        right: 16.w,
                      ),
                      child: widget.suffixIcon ?? suffixIcon(),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        Positioned(
            top: 16.h,
            left: 10,
            child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                decoration: BoxDecoration(
                    color: AppColor.hintTextGrey,
                    borderRadius: BorderRadius.circular(4.r)),
                child: Text(widget.labelText,
                    style: TextStyle(
                        color: AppColor.fomoGrey,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.3)))),
      ],
    );
  }

  Widget? suffixIcon() {
    if (widget.isPassword! && !widget.isConfirmPassword!) {
      return GestureDetector(
          onTap: () => setState(() {
                showPassword = !showPassword;
              }),
          child: PasswordSuffixWidget(
            showPassword: showPassword,
          ));
    }
    if (widget.showSuffixIcon! && widget.suffixIcon == null) {
      return Icon(Iconsax.arrow_down,
          size: 18, color: AppColor.gray.withOpacity(0.7));
    }

    if (widget.showSuffixIcon! && widget.suffixIcon != null) {
      //return const Icon(FontAwesomeIcons.circleCheck, size: 16, color: green);
      return widget.suffixIcon;
    }
    return null;
  }
}

class PasswordSuffixWidget extends StatelessWidget {
  final bool showPassword;
  const PasswordSuffixWidget({super.key, required this.showPassword});

  @override
  Widget build(BuildContext context) {
    return showPassword
        ? const Icon(
            Iconsax.eye4,
            color: AppColor.fomoGrey,
          )
        : const Icon(
            Iconsax.eye_slash,
            color: AppColor.fomoGrey,
          );
  }
}
