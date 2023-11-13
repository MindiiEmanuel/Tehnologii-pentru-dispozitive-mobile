import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'common/strings.dart';

void main() {
  runApp(const FirstApp());
}

///The main app widget. This is the root widget of the app.
class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: HomeScreen(),
    );
  }
}
