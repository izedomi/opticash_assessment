import 'package:flutter/services.dart';
import '../../env/env.dart';
import '../utils/print.dart';

class AppInitService {
  init() async {
    //screen orientation
    await _screenOrientationInit();

    //push notification
    //LocalPushNotificationService.init();

    //env
    Env().init(Env.dev);

    //package info
    //_packageInfoInit();
  }

  _screenOrientationInit() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    printty("===> screen orientation initialized...");
  }
}
