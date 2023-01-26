import 'package:flutter/material.dart';

class ConseilScreen extends StatefulWidget {
  const ConseilScreen({Key? key}) : super(key: key);

  @override
  State<ConseilScreen> createState() => _ConseilScreenState();
}

class _ConseilScreenState extends State<ConseilScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      color: Colors.blueGrey.shade900,
    );
  }
}
