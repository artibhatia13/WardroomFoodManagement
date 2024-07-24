import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/unit_screens/unit_homepage.dart';
import 'package:flutter_application_1/screens/user_screens/user_feedback.dart';
import 'package:flutter_application_1/screens/user_screens/user_homepage.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';
import 'package:flutter_application_1/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wardroom Dine',
      theme: appTheme,
      home: const UnitHomepage(),
    );
  }
}
