import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:voip/app/enum/viewstate.dart';
import 'package:voip/app/routes/routes.dart';
import 'package:voip/app/vm/home_vm.dart';
import 'package:voip/ui/screens/auth/widget/other_action.dart';
import 'package:voip/ui/helpers/custom_textfield.dart';
import 'package:voip/ui/utils/app_color.dart';
import 'package:voip/ui/utils/flushbar.dart';
import 'package:voip/ui/utils/media_query.dart';
import 'package:voip/ui/utils/space.dart';
import 'package:voip/ui/widgets/busy_overlay.dart';
import 'package:voip/ui/widgets/button_widgets.dart';
import '../../../app/utils/text_styles.dart';
import '../../../app/vm/signin_vm.dart';
import '../../widgets/pattern_money.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late UserVM userVM;

  @override
  void initState() {
    super.initState();
    userVM = Provider.of<UserVM>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInVM>(builder: (context, vm, _) {
      return BusyOverlay(
        show: vm.loginViewState == ViewState.busy,
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            child: SafeArea(
              child: SizedBox(
                width: deviceWidth(context),
                height: deviceHeight(context),
                child: Stack(
                  children: [
                    const PatternMoneyBg(
                      opacity: 1,
                    ),
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
                            Text("Sign In", style: TextStyles.onboardingLabel),
                            VSpace(8.h),
                            Text(
                                "Sign In to your account using your email\naddress and password",
                                style: TextStyles.onboardingSubLabel),
                            VSpace(4.h),
                            CustomTextField(
                              labelText: "Email",
                              controller: vm.emailController,
                              hintText: "emmanuel.izedomi1@gmail.com",
                              onChange: () => vm.notify(),
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
                                onChange: () => vm.notify()),
                            VSpace(41.h),
                            Align(
                              alignment: Alignment.center,
                              child: Text("Forgot Password?",
                                  style: TextStyles.onboardingSubLabel),
                            ),
                            VSpace(8.h),
                            OtherActionWidget(
                              label1: "Don't have an account?",
                              label2: "Create Account",
                              onTap: () => Navigator.pushNamed(
                                  context, AuthOnboardingRoute.signup),
                            ),
                            VSpace(36.h),
                            ButtonWidgets().customButton(
                                isActive: vm.loginBtnIsValid(),
                                context: context,
                                buttonColor: AppColor.brandBlack,
                                buttonText: "SIGN IN",
                                buttonTextSize: 16.sp,
                                buttonTextColor: AppColor.white,
                                function: () {
                                  _signin(vm);
                                }),
                            VSpace(13.h),
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

  _signin(SignInVM vm) async {
    final res = await vm.signin(userVM);
    if (res.first != 200) {
      Flush.toast(message: res.last);
      return;
    }
    gotoHomeScreen();
  }

  gotoHomeScreen() {
    Navigator.pushNamedAndRemoveUntil(context, HomeRoute.home, (r) => false);
  }
}
