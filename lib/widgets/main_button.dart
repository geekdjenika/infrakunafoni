import 'package:flutter/material.dart';

import '../constants.dart';

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.texte}) : super(key: key);
  final String texte;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        texte,
        textAlign: TextAlign.center,
        style: soustitre(Colors.white),
      ),
    );
  }
}
