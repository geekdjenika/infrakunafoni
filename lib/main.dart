import 'package:flutter/material.dart';
import 'package:infrakunafoni/screens/home.dart';
import 'package:infrakunafoni/screens/profile_screen.dart';
import 'package:infrakunafoni/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Infra Kunafoni',
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

