import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infrakunafoni/models/sessionjeu_model.dart';
import 'package:infrakunafoni/screens/home.dart';
import 'package:infrakunafoni/services/quiz_service.dart';
import 'package:infrakunafoni/widgets/main_button.dart';
import 'package:lottie/lottie.dart';

import '../../constants.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, required this.result, required this.questionLength, this.onPressed, required this.idQ}) : super(key: key);

  final int result;
  final int questionLength;
  final VoidCallback? onPressed;
  final int idQ;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  QuizService quizService = QuizService();


  getLastScore() async {

  }

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
              '${widget.result}/${widget.questionLength} réponses correctes !'
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
              widget.result == widget.questionLength / 2
                  ? 'Presque terminé !' // when the result is half of the questions
                  : widget.result < widget.questionLength / 2
                  ? 'Réessayer ?' // when the result is less than half
                  : 'Félicitation !', // when the result is more than half
              style: titregras(Colors.black),
            ),
            const SizedBox(height: 20),
            Lottie.asset(
              widget.result == widget.questionLength / 2
                  ? "assets/json/medium.json"
                  : widget.result < widget.questionLength / 2
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
                  '${widget.result}/${widget.questionLength}',
                  style: soustitre(Colors.white),
                ),
              ),
            ),
            Text(
              'Votre score',
              style: titre(CupertinoColors.darkBackgroundGray),
            ),
            Text(
              '${widget.result}',
              style: score(Colors.pink),
            ),
            Text(
              widget.result > 1 ? 'points' : 'point',
              style: titregras(CupertinoColors.darkBackgroundGray),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .025,),
            FutureBuilder<Map<String,dynamic>>(
              future: quizService.getLastScore(),
              builder: (context, data) {
                if(data.hasError) {
                  return Center(child: Text('Scores indisponibles', style: soustitre(Colors.black),),);
                } else if(data.hasData) {
                  var session = SessionJeu.fromJson(data.data!);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Votre dernier score :",
                        style: titreliste(Colors.black),
                      ),
                      Text(
                        '${session.points} points',
                        style: titreliste(Colors.black),
                      ),

                    ],
                  );
                } else {
                  return Center(child: Lottie.asset("assets/json/loading.json", width: 25, height: 25));
                }
              },
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
                          String scorejeu = await quizService.addSession(widget.idQ, widget.result);
                          print(scorejeu);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Accueil()));
                        },
                        child: Text(
                          'Accueil',
                          style: soustitre(background),
                        ),
                      ),
                      btnCancel: OutlinedButton(
                        onPressed: widget.onPressed,
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
