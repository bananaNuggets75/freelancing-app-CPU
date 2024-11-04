import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'home_page.dart' as home_page;
import 'login_page.dart' as login_page;

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HireMe',
      initialRoute: '/login',
      routes: {
        '/': (context) => const home_page.HomePage(),
        '/home': (context) => const home_page.HomePage(),
        '/login': (context) => login_page.LoginPage(),
      },
    );
  }
}
