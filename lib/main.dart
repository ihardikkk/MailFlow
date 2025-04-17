import 'package:flutter/material.dart';
import 'package:mail_merge/firstScreen.dart';
import 'package:mail_merge/home.dart';
import 'package:mail_merge/sign_upp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Firstscreen(), debugShowCheckedModeBanner: false);
  }
}
