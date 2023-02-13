import 'package:flutter/material.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/screens/auth/sign_in.dart';
import 'package:infrakunafoni/screens/auth/sign_up.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(connexion) {
      return const Connexion();
    } else {
      return const Inscription();
    }
  }
}
