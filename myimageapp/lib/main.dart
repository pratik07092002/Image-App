import 'package:flutter/material.dart';
import 'package:myimageapp/homescreen.dart';

void main() {
  runApp(const MyImageApp());
}

class MyImageApp extends StatefulWidget {
  const MyImageApp({super.key});

  @override
  State<MyImageApp> createState() => _MyImageAppState();
}

class _MyImageAppState extends State<MyImageApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}

