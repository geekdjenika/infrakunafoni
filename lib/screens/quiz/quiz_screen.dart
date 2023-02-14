import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infrakunafoni/models/question_model.dart';
import 'package:infrakunafoni/models/quiz_model.dart';
import 'package:infrakunafoni/screens/quiz/questions_screen.dart';
import 'package:infrakunafoni/services/quiz_service.dart';
import 'package:infrakunafoni/widgets/my_button.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';

import '../../constants.dart';
import '../../widgets/list_card.dart';
import '../auth/auth.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  Future<List<Quiz>> readJson() async {
    final String response =await rootBundle.loadString('assets/raw/Quiz.json');

    final list = await json.decode(response) as List<dynamic>;

    return list.map((e) => Quiz.fromJson(e)).toList(growable: true);
  }

  final ScrollController _controller = ScrollController();

  QuizService quizService = QuizService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: quizService.getAllQuiz(),
      builder: (context, data) {
        if(data.hasError) {
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  CupertinoIcons.xmark,
                  color: background,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Lottie.asset("assets/json/connectionlost.json"),
                    Text("Connexion perdue !", style: titregras(incorrect),),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Auth()));
                        },
                        child: Text("Connectez-vous pour jouer !", style: soustitre(background),)),
                    MyButton(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Auth())), text: "Connexion")
                  ],
                ),
              ),
            ),
          );
        } else if(data.hasData) {
          var liste = data.data as List<Quiz>;
          return liste.length == 0
            ? Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  CupertinoIcons.xmark,
                  color: background,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Lottie.asset("assets/json/connectionlost.json"),
                    Text("Connexion perdue !", style: titregras(incorrect),),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Auth()));
                        },
                        child: Text("Connectez-vous pour jouer !", style: soustitre(background),)),
                    MyButton(onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const Auth())), text: "Connexion")
                  ],
                ),
              ),
            ),
          )
          : ListView.builder(
            controller: _controller,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: liste.length,
            itemBuilder: (context, index) {
              return ListCard(
                listTile: ListTile(
                  onTap: () {
                    List<Question> qliste = [];
                    liste[index].questions!.forEach((question) {
                      qliste.add(
                          Question(id: question.id!, question: question.question!, options: {
                            question.reponse! : true,
                            question.mauvaisesReponses![0].reponse! : false,
                            question.mauvaisesReponses![1].reponse! : false,
                            question.mauvaisesReponses![2].reponse! : false,
                          })
                      );
                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionsScreen(questions: qliste)));
                  },
                  leading: CircleAvatar(
                    maxRadius: 20,
                    minRadius: 20,
                    backgroundColor: Colors.white,
                    child: Text(
                      '${index+1}',
                      style: soustitregras(background),
                    ),
                  ),
                  title: Text(
                    '${liste[index].label}',
                    style: titreliste(Colors.white),
                  ),
                  subtitle: Text(
                    'Nombre de questions : ${liste[index].questions?.length}',
                    style: soustitreliste(Colors.white),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      List<Question> qliste = [];
                      liste[index].questions!.forEach((question) {
                        qliste.add(
                          Question(id: question.id!, question: question.question!, options: {
                            question.reponse! : true,
                            question.mauvaisesReponses![0].reponse! : false,
                            question.mauvaisesReponses![1].reponse! : false,
                            question.mauvaisesReponses![2].reponse! : false,
                          })
                        );
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) => QuestionsScreen(questions: qliste)));
                    },
                    child: const Icon(
                      Icons.gamepad_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              );
            },
          );
        } else {
            return Center(child: Lottie.asset("assets/json/loading.json"));
        }
      },
    );
  }
}
