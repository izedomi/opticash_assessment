import 'package:voip/app/utils/print.dart';
import 'package:voip/app/vm/base_vm.dart';
import 'package:flutter/material.dart';
import '../enum/viewstate.dart';
import '../models/api_response.dart';
import '../services/dio/dio_api_service.dart';
import '../services/password_validator_service.dart';
import '../utils/app_text.dart';

class SignupVM extends BaseVM {
  late ApiResponse _apiResponse;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ValidatorStatus _validatorStatus = ValidatorStatus();
  ValidatorStatus get validatorStatus => _validatorStatus;

  bool _isMatchingPassword = false;
  bool get isMatchingPassword => _isMatchingPassword;

  bool _isValidEmail = false;
  bool get isValidEmail => _isValidEmail;

  ViewState _signupViewState = ViewState.idle;
  ViewState get signupViewState => _signupViewState;

  void setSignupViewState(ViewState viewState) {
    _signupViewState = viewState;
    notifyListeners();
  }

  validatePassword(String password) {
    _validatorStatus = PasswordValidatorService().validate(password);
    printty(_validatorStatus.isValid.toString());
    notify();
  }

  passwordMatch(String password, String confirmPassword) {
    _isMatchingPassword =
        PasswordValidatorService().passwordMatch(password, confirmPassword);
    notify();
  }

  emailIsValid() {
    _isValidEmail = emailController.text.isNotEmpty &&
        emailController.text.contains("@") &&
        emailController.text.contains(".");
    notify();
  }

  signupBtnIsValid() {
    return firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        isValidEmail &&
        validatorStatus.isValid;
  }

  signup() async {
    try {
      setSignupViewState(ViewState.busy);
      String url = "/user/test/register";

      Map<String, dynamic> data = {
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      };

      _apiResponse = await apiService.post(body: data, url: url);

      // Map<String, dynamic> user = _apiResponse.data["data"]["user"];
      // String token = _apiResponse.data["data"]["token"];
      // reset();

      setSignupViewState(ViewState.completed);
      return [_apiResponse.code, _apiResponse.message];
    } catch (e, s) {
      printty(e.toString());
      printty(s.toString());
      setSignupViewState(ViewState.error);
      return [500, _apiResponse.message ?? AppText.errorMsg];
    }
  }
}

// @override
// reset() {
//   firstNameController.clear();
//   lastNameController.clear();
//   emailController.clear();
//   passwordController.clear();
//   _validatorStatus = ValidatorStatus();
//   _isMatchingPassword = false;
//   _isValidEmail = false;
// }
