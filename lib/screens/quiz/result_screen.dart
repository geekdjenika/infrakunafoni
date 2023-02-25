import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infrakunafoni/screens/home.dart';
import 'package:infrakunafoni/services/quiz_service.dart';
import 'package:infrakunafoni/widgets/main_button.dart';
import 'package:lottie/lottie.dart';

import '../../constants.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.result, required this.questionLength, this.onPressed, required this.idQ}) : super(key: key);

  final int result;
  final int questionLength;
  final VoidCallback? onPressed;
  final int idQ;



  @override
  Widget build(BuildContext context) {
    QuizService quizService = QuizService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
              CupertinoIcons.back
          ),
        ),
        title: Center(
          child: Text(
              '$result/$questionLength réponses correctes !'
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: InkWell(
              onTap: () {

              },
              child: const Icon(
                  CupertinoIcons.sidebar_right
              ),
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
            Text(
              result == questionLength / 2
                  ? 'Presque terminé !' // when the result is half of the questions
                  : result < questionLength / 2
                  ? 'Réessayer ?' // when the result is less than half
                  : 'Félicitation !', // when the result is more than half
              style: titregras(Colors.black),
            ),
            const SizedBox(height: 20),
            Lottie.asset(
              result == questionLength / 2
                  ? "assets/json/medium.json"
                  : result < questionLength / 2
                  ? "assets/json/failed.json"
                  : "assets/json/success.json",
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 1.2,
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
                  '$result/$questionLength',
                  style: soustitre(Colors.white),
                ),
              ),
            ),
            Text(
              'Votre score',
              style: titre(CupertinoColors.darkBackgroundGray),
            ),
            Text(
              '$result',
              style: score(Colors.pink),
            ),
            Text(
              result > 1 ? 'points' : 'point',
              style: titregras(CupertinoColors.darkBackgroundGray),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    AwesomeDialog(
                      title: 'Quitter le quiz ?'.toUpperCase(),
                      titleTextStyle: titregras(Colors.black),
                      desc: 'Vous pouvez recommencer le quiz ou aller à la page d\'accueil !',
                      descTextStyle: titreliste(background),
                      context: context,
                      dialogType: DialogType.warning,
                      btnOk: OutlinedButton(
                        onPressed: () async {
                          String scorejeu = await quizService.addSession(idQ, result);
                          print(scorejeu);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Accueil()));
                        },
                        child: Text(
                          'Accueil',
                          style: soustitre(background),
                        ),
                      ),
                      btnCancel: OutlinedButton(
                        onPressed: onPressed,
                        child: Text(
                          'Reprendre',
                          style: soustitre(background),
                        ),
                      ),
                      
                    ).show();
                  },
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
    );
  }
}
