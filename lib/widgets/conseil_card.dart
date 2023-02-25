import 'package:flutter/cupertino.dart';
import 'package:infrakunafoni/constants.dart';

class ConseilCard extends StatelessWidget {
  const ConseilCard({Key? key, required this.widget, this.color}) : super(key: key);
  final Widget widget;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 180,
      ),
      decoration: BoxDecoration(
          color: color ?? neutral,
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
      child: widget
    );
  }
}
