// main.dart
import 'package:flutter/material.dart';
import 'home_page.dart' as home_page;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Name',
      initialRoute: "/",
      routes: {
        '/': (context) => const home_page.HomePage(),
        '/home': (context) => const home_page.HomePage(),
      },
    );
  }
}
