import 'package:flutter/material.dart';
import 'package:infrakunafoni/constants.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key, required this.widget}) : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,//MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        color: neutral,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(1, 1),
          )
        ]
      ),
      child: SingleChildScrollView(
        child: widget
      ),
    );
  }
}
