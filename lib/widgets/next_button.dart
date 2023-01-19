import 'package:flutter/material.dart';

import '../constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

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
        'Suivant',
        textAlign: TextAlign.center,
        style: soustitre(Colors.white),
      ),
    );
  }
}
