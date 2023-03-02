import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infrakunafoni/screens/quiz/result_screen.dart';
import 'package:infrakunafoni/services/quiz_service.dart';
import 'package:just_audio/just_audio.dart';
import 'package:vibration/vibration.dart';

import '../../constants.dart';
import '../../models/question_model.dart';
import '../../widgets/next_button.dart';
import '../../widgets/option_card.dart';
import '../../widgets/question_widget.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key, required this.questions, required this.idQ}) : super(key: key);
  final List<Question> questions;
  final int idQ;

  @override
  State<QuestionsScreen> createState() => _QuetionsScreenState();
}

class _QuetionsScreenState extends State<QuestionsScreen> {

  @override
  void initState() {
    // TODO: implement initState
    indexAleatoire = generateIndex();
  }

  QuizService quizService = QuizService();

  /*final List<Question> _questions = [
    Question(id: 1,
        question: "Laquelle de ces asertions est une infraction?",
        options: {
          'Manger dans sa voiture': false,
          'Arrêt non authorisé': true,
          'S\'arrêter quand on veut': false,
          'Se tenir debout sur sa moto': false,
        }),
    Question(id: 2,
        question: "Laquelle de ces asertions est une infraction?",
        options: {
          'Dans sa voiture': true,
          'Arrêt non': false,
          'S\'arrêter on veut': false,
          'Se tenir debout sur moto': false,
        }),
    Question(id: 3,
        question: "Laquelle de ces asertions est une infraction?",
        options: {
          'Manger': false,
          'Authorisé': false,
          'Quand on veut': false,
          'Debout sur sa moto': true,
        }),
    Question(id: 4,
        question: "Laquelle de ces asertions est une infraction?",
        options: {
          'Sa voiture': false,
          'Arrêt': false,
          'S\'arrêter veut': true,
          'Se moto': false,
        }),
    Question(id: 5,
        question: "Infraction?",
        options: {
          'Manger dans sa voiture': false,
          'Arrêt non authorisé': true,
          'S\'arrêter quand on veut': false,
          'Se tenir debout sur sa moto': false,
        }),
    Question(id: 6,
        question: "Est-ce une infraction?",
        options: {
          'Dans sa voiture': true,
          'Arrêt non': false,
          'S\'arrêter on veut': false,
          'Se tenir debout sur moto': false,
        }),
    Question(id: 7,
        question: "Choisis la bonne infraction?",
        options: {
          'Manger': false,
          'Authorisé': false,
          'Quand on veut': false,
          'Debout sur sa moto': true,
        }),
    Question(id: 8,
        question: "Une infraction?",
        options: {
          'Sa voiture': false,
          'Arrêt': false,
          'S\'arrêter veut': true,
          'Se moto': false,
        })
  ];*/

  int index = 0;

  int score = 0;

  bool isPressed = false;

  bool isAlreadySelected = false;

  final _player = AudioPlayer();


  // create a function to start over
  void startOver() async {
    String scorejeu = await quizService.addSession(widget.idQ, score);
    print(scorejeu);
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
      indexAleatoire = generateIndex();
    });
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void startToIndex(int i) {
    if(index == widget.questions.length -1) {
      setState(() {
        index = i;
        isPressed = false;
        isAlreadySelected = false;
        score = 0;
      });
    } else {
      setState(() {
        index = i;
        isPressed = false;
        isAlreadySelected = false;
      });
    }

    Navigator.pop(context);
  }

  Color choixCouleur(bool isPressed, bool index) {
    if(isPressed) {
      if(index) {
        return correct;
      } else {
        incorrect;
      }
    } else {
      return Colors.white;
    }
    return Colors.white;
  }

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      // this is the block where the questions end.
      showDialog(
          context: context,
          barrierDismissible:
          false,
          // this will disable the dissmis function on clicking outside of box
          builder: (ctx) =>
              ResultScreen(
                result: score, // total points the user got
                questionLength: questionLength, // out of how many questions
                idQ: widget.idQ,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++; // when the index will change to 1. rebuild the app.
          isPressed = false;
          isAlreadySelected = false;
          indexAleatoire = generateIndex();
        });
      } else {
        Fluttertoast.showToast(
          msg: 'Choississez une réponse svp !',
          textColor: Colors.white,
          backgroundColor: background
        );
        /*ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Choississez une réponse svp !'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));*/
      }
    }
  }

  List indexAleatoire = [];

  List generateIndex() {
    List<int> numberList=[];
    while(numberList.length < widget.questions[index].options.length){
      int randomNumber = Random().nextInt(widget.questions[index].options.length);
      if (!numberList.contains(randomNumber)){
        numberList.add(randomNumber);
      }
    }
    print(numberList);
    return numberList;
  }

  void checkAnswerAndUpdate(bool value) async {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score+=100;
        await _player.setAsset('assets/aud/correct.mp3');
        _player.play();
      } else {
        Vibration.vibrate(duration: 80);
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                'Score: $score',
              style: soustitre(Colors.white),
            ),
            Text('Q. ${(index+1).toString().padLeft(2,'0')}', style: soustitre(Colors.white)),
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (ctx) => ResultScreen(
                  result: score,
                  questionLength: widget.questions.length,
                  idQ: widget.idQ,
                  onPressed: () => startOver,
                )
                );
              },
              child: const Icon(
                Icons.menu_rounded,
              ),
            )
          ],
        ),
        backgroundColor: background,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.85,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
          decoration: BoxDecoration(
            color: neutral,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              // add the questionWIdget here
              QuestionWidget(
                indexAction: index, // currently at 0.
                question: widget.questions[index]
                    .question, // means the first question in the list.
                totalQuestions:
                widget.questions.length, // total length of the list
              ),
              //const Divider(color: Colors.white),
              // add some space
              const SizedBox(height: 25.0),
              for (int i = 0;
              i < widget.questions[index].options.length;
              i++)
                GestureDetector(
                  onTap: () =>
                      checkAnswerAndUpdate(
                          widget.questions[index].options.values.toList()[indexAleatoire.elementAt(i)]),
                  child: OptionCard(
                    option: widget.questions[index].options.keys.toList()[indexAleatoire.elementAt(i)],
                    color: isPressed
                        ? widget.questions[index]
                        .options
                        .values
                        .toList()[indexAleatoire.elementAt(i)] ==
                        true
                        ? correct
                        : incorrect
                        : Colors.white,
                  ),
                ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: () => {
                      nextQuestion(widget.questions.length)
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60.0),
                      child: NextButton(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      // use the floating action button
      /*floatingActionButton: GestureDetector(
        onTap: () => nextQuestion(_questions.length),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0,vertical: 30),
          child: NextButton(// the above function
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,*/
    );
  }
}

