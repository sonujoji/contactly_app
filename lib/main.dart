import 'package:flutter/material.dart';
import 'package:my_app/screens/splash.dart';

const SAVE_KEY_NAME = 'User logged In ';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ScreenSplash(),
    );
  }


}
