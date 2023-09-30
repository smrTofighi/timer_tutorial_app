import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_tutorial_app/core/theme/theme.dart';
import 'package:timer_tutorial_app/modules/timer/timer_page.dart';


void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
      enabled: true,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Timer App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.light,
      //initialBinding: TimerBinding(),
      home: TimerPage(),
    );
  }
}
