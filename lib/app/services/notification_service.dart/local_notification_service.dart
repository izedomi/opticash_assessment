import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:opticash/ui/screens/welcome/splash_screen.dart';
import '../../../main.dart';
import '../../utils/print.dart';
import 'push_notification_router_service.dart';
import 'package:http/http.dart' as http;

class LocalNotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static String url =
      "https://avatars.githubusercontent.com/u/85095303?s=200&v=4";

  static Future init({bool schedule = false}) async {
    //android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('exchange_pal');

    //ios
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            requestSoundPermission: true,
            requestBadgePermission: true,
            requestAlertPermission: true,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    //initialize
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    _notifications.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  static onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
  }

  static onDidReceiveNotificationResponse(NotificationResponse response) async {
    printty("Notification clicked:  ${response.payload.toString()}");

    try {
      if (response.payload != null) {
        Map<String, dynamic> payload = json.decode(response.payload!);
        NotificationRouterService.router(payload, navigatorKey.currentContext!);
        return;
      }
      navigatorKey.currentState
          ?.push(MaterialPageRoute(builder: (_) => const SplashScreen()));
    } catch (e, s) {
      // something went wrong for any reason, go back to home screen
      printty("OnClickNotificationError: ${e.toString()}");
      printty("OnClickNotificationStackTrace: ${s.toString()}");
      navigatorKey.currentState
          ?.push(MaterialPageRoute(builder: (_) => const SplashScreen()));
    }
  }

  static Future showNotification(
      {var id = 0,
      required String title,
      required String body,
      dynamic payload}) async {
    String? attachmentPath;
    // try {
    //   attachmentPath = await downloadFilez(url, "attachment_img.png");
    // } catch (e) {
    //   printty(e.toString());
    // }
    return _notifications.show(
        id, title, body, await notificationDetails(attachmentPath),
        payload: payload);
  }

  static notificationDetails(String? attachmentPath) async {
    String channelId = DateTime.now().toIso8601String();
    return NotificationDetails(
      android: AndroidNotificationDetails(
        channelId,
        channelId,
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        largeIcon: attachmentPath != null
            ? FilePathAndroidBitmap(attachmentPath)
            : null,
      ),
    );
  }

  static Future downloadFilez(String url, String name) async {
    var dir = await getApplicationDocumentsDirectory();
    var imageDownloadPath = '${dir.path}/$name';
    var res = await http.get(Uri.parse(url));
    File file = File(imageDownloadPath);
    await file.writeAsBytes(res.bodyBytes);
    return imageDownloadPath;
  }
}
