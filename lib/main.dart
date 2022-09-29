import 'package:athan/screen.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prayer Time',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenTime(),
    );
  }
}
