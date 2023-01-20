import 'package:flutter/material.dart';
import 'package:infrakunafoni/screens/question/home.dart';
import 'package:infrakunafoni/screens/question/questions_screen.dart';
import 'package:infrakunafoni/widgets/result_box.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infra Kunafoni',
      debugShowCheckedModeBanner: false,
      home: Accueil(),
    );
  }
}

