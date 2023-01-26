import 'package:flutter/material.dart';
import 'package:infrakunafoni/constants.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key? key, required this.listTile}) : super(key: key);
  final ListTile listTile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 2),
              )
            ]
        ),
        child: listTile,
      ),
    );
  }
}
