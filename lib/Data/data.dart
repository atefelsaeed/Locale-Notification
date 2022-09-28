import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;

mixin Data {
  final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    tz.initializeTimeZones();
    // Android initialization
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
            'card6'); //if you want to change the icon "card6" go to >> android >> app >> src >> main >> res >> drawable

    // ios initialization
    IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    // the initialization settings are initialized after they are setted
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );
  }

  ///This function used if user tap to notification do an action.
  void onSelectNotification(String? payload) {
    print('payload $payload');
    if (payload != null && payload.isNotEmpty) {
      onNotificationClick.add(payload);
    }
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id $id');
  }

}
