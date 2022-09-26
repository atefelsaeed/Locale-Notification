import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen(
      {Key? key,
      required this.payload,
      required this.notificationDescriptions,
      required this.notificationTitle})
      : super(key: key);
  final String payload, notificationDescriptions, notificationTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                payload,
                style: const TextStyle(fontSize: 35),
              ),
            ),
            Text(
              notificationTitle,
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                  fontWeight: FontWeight.w800),
            ),
            Text(
              notificationDescriptions,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.red,
              ),
            ),
          ],
        ));
  }
}
