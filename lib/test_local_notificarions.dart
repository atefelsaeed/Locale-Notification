import 'package:flutter/material.dart';
import 'package:locale_notifications/second_screen.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'schedual_notification.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController Notification_title = TextEditingController();
  TextEditingController Notification_descrp = TextEditingController();

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
            notificationTitle: Notification_title.text.isEmpty
                ? "Notification title"
                : Notification_title.text,
            notificationDescriptions: Notification_descrp.text.isEmpty
                ? "Notification Descriptions"
                : Notification_descrp.text,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            const Text("Enter your Notification Data !"),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: Notification_title,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Title",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: Notification_descrp,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Description",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () async {
                  await service.showNotification1(
                    id: 0,
                    title: Notification_title.text.isEmpty
                        ? "title Scheduled"
                        : Notification_title.text,
                    body: Notification_descrp.text.isEmpty
                        ? "body Scheduled"
                        : Notification_descrp.text,
                  );
                },
                child: Container(
                  height: 40,
                  width: 200,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      "Show Notification",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () async {
                  await service.showPayloadNotification1(
                    id: 2,
                    title: Notification_title.text.isEmpty
                        ? "title Scheduled"
                        : Notification_title.text,
                    body: Notification_descrp.text.isEmpty
                        ? "body Scheduled"
                        : Notification_descrp.text,
                    payload: "Payload Navigation",
                  );
                },
                child: Container(
                  height: 40,
                  width: 200,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      "Show Payload Notification",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: GestureDetector(
                onTap: () async {
                  await service.showScheduledNotification1(
                    id: 1,
                    title: Notification_title.text.isEmpty
                        ? "title Scheduled"
                        : Notification_title.text,
                    body: Notification_descrp.text.isEmpty
                        ? "body Scheduled"
                        : Notification_descrp.text,
                    seconds: 4,
                  );
                },
                child: Container(
                  height: 40,
                  width: 200,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      "Show Scheduled Notification",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
