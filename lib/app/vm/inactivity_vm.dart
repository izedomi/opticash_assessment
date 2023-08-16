import 'dart:async';
import 'package:flutter/material.dart';
import 'package:voip/app/routes/routes.dart';

import '../../main.dart';
import '../models/signin_response.dart';
import '../services/storage_service.dart';

class InactivityVM extends ChangeNotifier {
  Timer? _timer;

  Duration? _timeDuration;
  Duration? get timeDuration => _timeDuration;
  set timeDuration(dynamic val) {
    _timeDuration = val;
  }

  void startTimer() {
    //printty("start timer");
    if (_timer != null) _timer?.cancel();
    _timer = Timer(_timeDuration!, _onIdle);
  }

  isActive() {
    if (_timer != null && !_timer!.isActive) {
      _onIdle();
    } else {
      startTimer();
    }
  }

  void _onIdle() async {
    // Log out the user here
    //printty("Idle: logout");
    if (await _userIsLoggedIn()) {
      Navigator.pushNamed(
          navigatorKey.currentContext!, AuthOnboardingRoute.lock);
    } else {
      Navigator.pushNamed(navigatorKey.currentContext!, WelcomeRoute.intro);
    }
  }

  void onActivity() async {
    // printty("onactivity");
    // startTimer();
    if (await _userIsLoggedIn()) {
      startTimer();
    } else {
      if (_timer != null) _timer?.cancel();
    }
  }

  resetValues() async {
    _timer = null;
  }

  _userIsLoggedIn() async {
    User? user = await StorageService.getUser();
    return user != null;
  }
}
