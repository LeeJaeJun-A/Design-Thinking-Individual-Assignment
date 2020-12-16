import 'package:designthinking/loginpage.dart';
import 'package:designthinking/rootpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.deepPurpleAccent,
          accentColor: Colors.black),
      home: RootPage(),
    );
  }
}
