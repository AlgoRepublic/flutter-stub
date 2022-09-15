import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationSetup {
  Future<void> initNotification() async {
    await FlutterLocalNotificationsPlugin()
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    var initializationSettingsAndroid =
        const AndroidInitializationSettings("@mipmap/launcher_icon");

    var initializationSettingsIOS = const IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await FlutterLocalNotificationsPlugin().initialize(initializationSettings,
        onSelectNotification: (payload) async {
      return;
    });
  }

  void firebaseNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;

      if (notification != null) {
        Map data = message.data;
        if (data["message_notification"] == "true") {
        } else {
          _showNotification(notification.title!, notification.body!);
        }
      }
    });
  }

  Future<void> _showNotification(String title, String body) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        enableVibration: true,
        ticker: 'ticker');

    var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
      presentAlert: true,
      presentSound: true,
      presentBadge: true,
    );

    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await FlutterLocalNotificationsPlugin()
        .show(0, title, body, platformChannelSpecifics);
  }

  Future<String?> getToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    return token;
  }
}
