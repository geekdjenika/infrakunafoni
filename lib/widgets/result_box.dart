import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infrakunafoni/widgets/main_button.dart';

import '../constants.dart';

class ResultBox extends StatelessWidget {
  ResultBox({Key? key, required this.result, required this.questionLength, this.onPressed}) : super(key: key);

  final int result;
  final int questionLength;
  VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: Icon(
          CupertinoIcons.back
        ),
        title: Center(
          child: Text(
              '$result/$questionLength réponses correctes !'
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              CupertinoIcons.sidebar_left
            ),
          )
        ],
      ),
      backgroundColor: background,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.85,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
        decoration: BoxDecoration(
          color: neutral,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  result == questionLength / 2
                      ? 'Presque terminé !' // when the result is half of the questions
                      : result < questionLength / 2
                      ? 'Réessayer ?' // when the result is less than half
                      : 'Félicitation !', // when the result is more than half
                  style: titre(Colors.black),
                ),
                CircleAvatar(
                    minRadius: 20,
                    maxRadius: 20,
                    backgroundColor: result == questionLength / 2
                        ? Colors.yellow // when the result is half of the questions
                        : result < questionLength / 2
                        ? incorrect // when the result is less than half
                        : correct,
                    child: GestureDetector(
                      onTap: onPressed,
                      child: Icon(
                          result == questionLength / 2
                              ? CupertinoIcons.gobackward_45
                              : result < questionLength / 2
                              ? CupertinoIcons.gobackward_minus
                              : CupertinoIcons.wand_rays_inverse
                      ),
                    )
                  // when the result is more than half
                ),
              ],
            ),
            const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              direction: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: background,
                  ),
                  child: Center(
                    child: Text(
                      '$questionLength',
                      style: soustitre(Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: background,
                  ),
                  child: Center(
                    child: Text(
                      '$questionLength',
                      style: soustitre(Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: background,
                  ),
                  child: Center(
                    child: Text(
                      '$questionLength',
                      style: soustitre(Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: background,
                  ),
                  child: Center(
                    child: Text(
                      '$questionLength',
                      style: soustitre(Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: background,
                  ),
                  child: Center(
                    child: Text(
                      '$questionLength',
                      style: soustitre(Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: background,
                  ),
                  child: Center(
                    child: Text(
                      '$questionLength',
                      style: soustitre(Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: background,
                  ),
                  child: Center(
                    child: Text(
                      '$questionLength',
                      style: soustitre(Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: background,
                  ),
                  child: Center(
                    child: Text(
                      '$questionLength',
                      style: soustitre(Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onTap: () => {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.0),
                    child: MainButton(texte: 'Terminer'),
                  ),
                ),
              ),
            )

          ],
        ),
      ),
    );/*AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Résultat'.toUpperCase(),
              style: soustitregras(Colors.white),
            ),
            const SizedBox(height: 20.0),
            CircleAvatar(
              child: Text(
                '$result/$questionLength',
                style: titre(Colors.white),
              ),
              radius: 70.0,
              backgroundColor: result == questionLength / 2
                  ? Colors.yellow // when the result is half of the questions
                  : result < questionLength / 2
                  ? incorrect // when the result is less than half
                  : correct, // when the result is more than half
            ),
            const SizedBox(height: 20.0),
            Text(
              result == questionLength / 2
                  ? 'Presque terminé !' // when the result is half of the questions
                  : result < questionLength / 2
                  ? 'Réessayer ?'.toUpperCase() // when the result is less than half
                  : 'Félicitation !'.toUpperCase(), // when the result is more than half
              style: soustitre(neutral),
            ),
            const SizedBox(height: 25.0),
            GestureDetector(
              onTap: onPressed,
              child: Text(
                'Recommencer'.toUpperCase(),
                style: soustitre(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}
