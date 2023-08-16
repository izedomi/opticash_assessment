import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voip/app/services/storage_service.dart';
import '../models/signin_response.dart';
import '../routes/routes.dart';
import '../vm/home_vm.dart';

class PageSwitcherService {
  BuildContext context;
  PageSwitcherService(this.context);

  switchPage() {
    Timer(const Duration(milliseconds: 5000), () async {
      _redirectUser();
    });
  }

  _redirectUser() async {
    final User? user = await StorageService.getUser();
    String? token = await StorageService.getAccessToken();

    if (user == null || token == null) {
      gotoNextScreen(WelcomeRoute.intro);
      return;
    }

    gotoNextScreen(AuthOnboardingRoute.lock, user: user);
  }

  gotoNextScreen(String path, {dynamic args, User? user}) {
    Provider.of<UserVM>(context, listen: false).setCurrentUser(user);
    Navigator.pushNamedAndRemoveUntil(
        context, path, arguments: args, (r) => false);
  }
}
