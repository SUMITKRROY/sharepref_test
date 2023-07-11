import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharepref_test/splash_screen.dart';
import 'package:uuid/uuid.dart';

import 'RegistrationPage.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UUID Token App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => SplashScreen(),
        '/registration': (BuildContext context) => RegistrationPage(),
        '/home': (BuildContext context) => HomePage(uuid: '',context: context),
      },
    );
  }
}
