import 'package:opticash/app/vm/base_vm.dart';
import 'package:flutter/material.dart';
import '../enum/viewstate.dart';
import '../utils/app_text.dart';

class ForgotPasswordVM extends BaseVM {
  TextEditingController emailController = TextEditingController();

  ViewState _passwordViewState = ViewState.idle;
  ViewState get passwordViewState => _passwordViewState;

  void setPasswordViewState(ViewState viewState) {
    _passwordViewState = viewState;
    notifyListeners();
  }

  emailIsValid() {
    return emailController.text.isNotEmpty &&
        emailController.text.contains("@") &&
        emailController.text.contains(".");
  }

  sendResentLink() async {
    try {
      // setPasswordViewState(ViewState.busy);

      // final res = await AuthService().resetPassword(emailController.text);
      // if (!res.success) {
      //   setPasswordViewState(ViewState.completed);
      //   return [res.code, res.message];
      // }
      // reset();
      // setPasswordViewState(ViewState.completed);
      // return [200, "Reset link has been sent to your email"];
    } catch (e) {
      setPasswordViewState(ViewState.error);
      return [500, AppText.errorMsg];
    }
  }

  @override
  reset() {
    emailController.clear();
  }
}
