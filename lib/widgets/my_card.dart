import 'package:flutter/material.dart';
import 'package:infrakunafoni/constants.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.widget, this.color}) : super(key: key);
  final Widget widget;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: color != null ? color : neutral,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: background,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(1, 1),
          )
        ]
      ),
      child: SingleChildScrollView(
        child: widget
      ),
    );
  }
}
