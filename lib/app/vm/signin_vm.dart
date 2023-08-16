import 'package:voip/app/models/signin_response.dart';
import 'package:voip/app/services/storage_service.dart';
import 'package:voip/app/utils/print.dart';
import 'package:voip/app/vm/base_vm.dart';
import 'package:flutter/material.dart';
import 'package:voip/app/vm/home_vm.dart';
import '../enum/viewstate.dart';

import '../models/api_response.dart';
import '../services/dio/dio_api_service.dart';
import '../utils/app_text.dart';

class SignInVM extends BaseVM {
  late ApiResponse _apiResponse;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ViewState _loginViewState = ViewState.idle;
  ViewState get loginViewState => _loginViewState;

  void setLoginViewState(ViewState viewState) {
    _loginViewState = viewState;
    notifyListeners();
  }

  emailIsValid() {
    return emailController.text.isNotEmpty &&
        emailController.text.contains("@") &&
        emailController.text.contains(".");
  }

  loginBtnIsValid() {
    return emailIsValid() && passwordController.text.isNotEmpty;
  }

  signin(UserVM userVM) async {
    try {
      setLoginViewState(ViewState.busy);
      String url = "/user/test/login";

      Map<String, dynamic> data = {
        "email": emailController.text,
        "password": passwordController.text,
      };

      _apiResponse = await apiService.post(body: data, url: url);

      Map<String, dynamic> user = _apiResponse.data["data"]["user"];
      String token = _apiResponse.data["data"]["accessToken"];

      userVM.setCurrentUser(User.fromJson(user));
      StorageService.storeAccessToken(token);
      StorageService.storeUser(user);
      reset();

      setLoginViewState(ViewState.completed);
      return [_apiResponse.code, _apiResponse.message];
    } catch (e) {
      setLoginViewState(ViewState.error);
      return [500, _apiResponse.message ?? AppText.errorMsg];
    }
  }

  @override
  reset() {
    emailController.clear();
    passwordController.clear();
  }
}
