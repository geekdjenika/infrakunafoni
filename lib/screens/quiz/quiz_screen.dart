import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late AudioPlayer _player;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _player.setAsset('assets/aud/6000F bm.m4a');
        await _player.play();
      },
        child: Container(
        height: 23,
        width: 23,
        color: Colors.deepOrange,
      ),
      );
  }
}
