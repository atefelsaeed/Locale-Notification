import 'package:flutter/material.dart';
import 'package:locale_notifications/Data/schedual_notification.dart';
import 'package:locale_notifications/UI/Screens/HomeScreen/local_notificarions_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locale Notification',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const LocaleNotificationScreen(
        title: 'Locale Notification',
      ),
    );
  }
}
