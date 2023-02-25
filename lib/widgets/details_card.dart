
import 'package:flutter/material.dart';

import '../constants.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({Key? key, required this.widget, this.color}) : super(key: key);
  final Widget widget;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height / 2),
      decoration: BoxDecoration(
          color: color != null ? color : Colors.white,
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
      child: Container(
          child: widget
      ),
    );
  }
}
