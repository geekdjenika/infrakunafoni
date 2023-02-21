import 'package:flutter/material.dart';
import 'package:infrakunafoni/provider/utilisateur_provider.dart';
import 'package:infrakunafoni/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UtilisateurProvider>(
      create: (context) => UtilisateurProvider(),
      child:  const MaterialApp(
        title: 'Infra Kunafoni',
        debugShowCheckedModeBanner: false,
        home: Accueil(),
      ),
    );/*const MaterialApp(
      title: 'Infra Kunafoni',
      debugShowCheckedModeBanner: false,
      home: Accueil(),
    );*/
  }
}

