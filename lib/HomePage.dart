import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  final String uuid;
  final BuildContext context;

  HomePage({required this.uuid, required this.context});

  void _removeLocalData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('uuid_token');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Local Data Removed'),
          content: Text('The UUID token has been removed from local storage.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Token Available',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16.0),
            Text(
              'UUID: $uuid',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _removeLocalData,
              child: Text('Remove Local Data'),
            ),
          ],
        ),
      ),
    );
  }
}
