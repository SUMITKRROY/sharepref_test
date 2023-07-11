import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'RegistrationPage.dart';
import 'HomePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUUIDToken();
  }

  Future<void> _checkUUIDToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? uuidToken = prefs.getString('uuid_token');

    await Future.delayed(Duration(seconds: 2)); // Simulating a delay for the splash screen

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        if (uuidToken != null && uuidToken.isNotEmpty) {
          return HomePage(uuid: uuidToken, context: context,);
        } else {
          return RegistrationPage();
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
