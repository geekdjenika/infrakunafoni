import 'package:flutter/material.dart';

import '../constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({Key? key, required this.option, required this.color}) : super(key: key);

  final String option;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: color,
      child: ListTile(
        //onTap: onPressed,
        title: Text(
          option,
          //textAlign: TextAlign.center,
          style: soustitre(color.red != color.green ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
