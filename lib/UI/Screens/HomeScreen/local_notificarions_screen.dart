import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

import '../../../Data/schedual_notification.dart';
import '../SecondScreen/second_screen.dart';
import 'Widgets/item_btn.dart';

class LocaleNotificationScreen extends StatefulWidget {
  const LocaleNotificationScreen({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  _LocaleNotificationScreenState createState() =>
      _LocaleNotificationScreenState();
}

class _LocaleNotificationScreenState extends State<LocaleNotificationScreen> {
  TextEditingController notificationTitle = TextEditingController();
  TextEditingController notificationDescription = TextEditingController();
  late final NotificationService service;

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(
            payload: payload,
            notificationTitle: notificationTitle.text.isEmpty
                ? "Notification title"
                : notificationTitle.text,
            notificationDescriptions: notificationDescription.text.isEmpty
                ? "Notification Descriptions"
                : notificationDescription.text,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    service = NotificationService();
    service.initNotification();
    listenToNotification();
    super.initState();
    tz.initializeTimeZones();
  }

  @override
  void dispose() {
    notificationTitle.dispose();
    notificationDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your Notification Data !",
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.055),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: notificationTitle,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Title",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: notificationDescription,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Description",
                  ),
                ),
              ),
              const Text(
                  'Show Notification: This is the default notification.'),
              ItemButton(
                function: () async {
                  await service.showNotification1(
                    id: 0,
                    title: notificationTitle.text.isEmpty
                        ? "title Scheduled"
                        : notificationTitle.text,
                    body: notificationDescription.text.isEmpty
                        ? "body Scheduled"
                        : notificationDescription.text,
                  );
                },
                btnTitle: "Show Notification",
              ),
              const Text(
                  'Show Payload Notification: If you taped this notification it opened on the second screen.'),
              ItemButton(
                function: () async {
                  await service.showPayloadNotification1(
                    id: 2,
                    title: notificationTitle.text.isEmpty
                        ? "title Scheduled"
                        : notificationTitle.text,
                    body: notificationDescription.text.isEmpty
                        ? "body Scheduled"
                        : notificationDescription.text,
                    payload: "Payload Navigation",
                  );
                },
                btnTitle: "Show Payload Notification",
              ),
              const Text(
                  'Show Scheduled Notification: This will be pushed after 4 seconds.'),
              ItemButton(
                function: () async {
                  await service.showScheduledNotification1(
                    id: 1,
                    title: notificationTitle.text.isEmpty
                        ? "title Scheduled"
                        : notificationTitle.text,
                    body: notificationDescription.text.isEmpty
                        ? "body Scheduled"
                        : notificationDescription.text,
                    seconds: 4,
                  );
                },
                btnTitle: "Show Scheduled Notification",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
