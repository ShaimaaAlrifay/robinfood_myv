import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings_screen.dart';
import 'messages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      home: const SettingsScreen(),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
      ],
      themeMode: ThemeMode.light,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}