import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:opticash/app/constants/font_family.dart';
import 'package:opticash/app/constants/png_image_asset.dart';
import 'package:opticash/app/enum/viewstate.dart';
import 'package:opticash/app/routes/routes.dart';
import 'package:opticash/app/vm/signup_vm.dart';
import 'package:opticash/ui/screens/auth/widget/other_action.dart';
import 'package:opticash/ui/helpers/custom_textfield.dart';
import 'package:opticash/ui/screens/auth/widget/strength_indicator.dart';
import 'package:opticash/ui/utils/app_color.dart';
import 'package:opticash/ui/utils/flushbar.dart';
import 'package:opticash/ui/utils/media_query.dart';
import 'package:opticash/ui/utils/space.dart';
import 'package:opticash/ui/widgets/busy_overlay.dart';
import 'package:opticash/ui/widgets/button_widgets.dart';
import '../../../app/enum/dialog_type.dart';
import '../../../app/utils/text_styles.dart';
import '../../shared/dialogs/dialog_content.dart';
import '../../shared/dialogs/dialog_wrapper.dart';
import '../../widgets/pattern_money.dart';
import '../welcome/widgets/swipe_indicator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SignupVM>(builder: (context, vm, _) {
      return BusyOverlay(
        show: vm.signupViewState == ViewState.busy,
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: SafeArea(
              child: SizedBox(
                width: deviceWidth(context),
                height: deviceHeight(context),
                child: Stack(
                  children: [
                    const PatternMoneyBg(),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VSpace(30.h),
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Container(
                                width: 30.w,
                                height: 35.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(color: AppColor.black)),
                                child: const Icon(
                                  Icons.chevron_left,
                                  color: AppColor.bakoBlack,
                                  size: 20,
                                ),
                              ),
                            ),
                            VSpace(30.h),
                            Text("Create Account",
                                style: TextStyles.onboardingLabel),
                            VSpace(8.h),
                            Text(
                                "Register a new account using your email\naddress and fill in your informations",
                                style: TextStyles.onboardingSubLabel),
                            VSpace(8.h),
                            CustomTextField(
                              labelText: "FirstName",
                              controller: vm.firstNameController,
                              hintText: "Emmanuel",
                              onChange: () => vm.notify(),
                            ),
                            VSpace(4.h),
                            CustomTextField(
                              labelText: "LastName",
                              controller: vm.lastNameController,
                              hintText: "Doe",
                              onChange: () => vm.notify(),
                            ),
                            VSpace(4.h),
                            CustomTextField(
                              labelText: "Email",
                              controller: vm.emailController,
                              hintText: "emmanuel@gmail.com",
                              errorText: vm.emailController.text.isNotEmpty &&
                                      !vm.isValidEmail
                                  ? "Invalid Email"
                                  : null,
                              onChange: () => vm.emailIsValid(),
                            ),
                            VSpace(4.h),
                            CustomTextField(
                                labelText: "Password",
                                controller: vm.passwordController,
                                hintText: "⚫️⚫️⚫️⚫️⚫️⚫️⚫️⚫️⚫️",
                                hintStyle: TextStyle(
                                    fontSize: 12.sp, color: AppColor.wiBlack),
                                isPassword: true,
                                showSuffixIcon: true,
                                onChange: () {
                                  vm.validatePassword(
                                      vm.passwordController.text);
                                }),
                            VSpace(4.h),
                            if (vm.passwordController.text.isNotEmpty)
                              StrengthIndicator(
                                  validatorStatus: vm.validatorStatus),
                            if (vm.passwordController.text.isEmpty)
                              Text(
                                  "Password must be of length 8, contain an uppercase, a lowercase, a number & a special character.",
                                  style: TextStyle(
                                      color: AppColor.kayGreen,
                                      fontSize: 10.sp,
                                      height: 1.4,
                                      fontFamily: poppins)),
                            VSpace(vm.passwordController.text.isNotEmpty
                                ? 41.h
                                : 30.h),
                            OtherActionWidget(
                              label1: "Already have an account?",
                              label2: "Sign In",
                              onTap: () => Navigator.pushNamed(
                                  context, AuthOnboardingRoute.sigin),
                            ),
                            VSpace(16.h),
                            ButtonWidgets().customButton(
                                isActive: vm.signupBtnIsValid(),
                                context: context,
                                buttonColor: AppColor.brandBlack,
                                buttonText: "CREATE NEW ACCOUNT",
                                buttonTextSize: 16.sp,
                                buttonTextColor: AppColor.white,
                                function: () {
                                  _signup(vm);
                                }),
                            VSpace(13.h),
                            Align(
                              alignment: Alignment.center,
                              child: Text("By Signing up you agree to our",
                                  style: TextStyles.onboardingSubLabel),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Terms Of Use',
                                  style: TextStyle(
                                      color: AppColor.fomoGreen,
                                      fontSize: 14.sp,
                                      fontFamily: poppins,
                                      fontWeight: FontWeight.w600),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' and ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: AppColor.fomoGrey,
                                            fontFamily: poppins,
                                            fontSize: 14.sp)),
                                    TextSpan(
                                        text: 'Privacy Policy',
                                        style: TextStyle(
                                            color: AppColor.fomoGreen,
                                            fontSize: 14.sp,
                                            fontFamily: poppins,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  _signup(SignupVM vm) async {
    final res = await vm.signup();
    if (res.first != 200) {
      Flush.toast(message: res.last);
      return;
    }
    gotoUsersScreen();
  }

  gotoUsersScreen() {
    // Navigator.pushNamed(context, UserRoute.users);
    showCustomDialog(
      context,
      canDismiss: true,
      child: confirmationDialog(
          title: "Account Created\nSuccessfully",
          description: "",
          context: context,
          imgUrl: PngImageAsset.logo,
          imageHeight: 93.h,
          imageWidth: 79.w,
          onTapContinue: () {
            Navigator.pushNamed(context, AuthOnboardingRoute.sigin);
          },
          continueLabel: "SIGN IN",
          dialogType: DialogType.success),
    );
  }
}
