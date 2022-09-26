import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:locale_notifications/data.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationService with Data {
  NotificationService();

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'main_channel',
      'Main Channel',
      channelDescription: "ashwin",
      importance: Importance.max,
      //Added sound >> if you want to change it go to android >> app >> main >> res >> raw
      sound: RawResourceAndroidNotificationSound('sound1'),
      playSound: true,
      priority: Priority.max,
    );
    const IOSNotificationDetails iosNotificationDetails =
        IOSNotificationDetails(
      sound: 'default.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  /// =========Default Locale Notification
  Future<void> showNotification1({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await flutterLocalNotificationsPlugin.show(id, title, body, details);
  }

  ///===========Payload Notification >> if the user tap it it opens in app in second screen
  Future<void> showPayloadNotification1({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final details = await _notificationDetails();
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      details,
      payload: payload,
    );
  }

  ///===Scheduled Notification that occurred with specific duration======
  Future<void> showScheduledNotification1({
    required int id,
    required String title,
    required String body,
    required int seconds,
  }) async {
    final details = await _notificationDetails();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(
        DateTime.now().add(Duration(seconds: seconds)),
        tz.local,
      ),
      details,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
