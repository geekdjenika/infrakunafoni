import 'package:infrakunafoni/models/question_model.dart';
import 'package:infrakunafoni/models/utilisateur_model.dart';

class Quiz {
  int? id;
  String? label;
  List<Questions>? questions;
  List<Utilisateur>? joueurs;

  Quiz({this.id, this.label, this.questions, this.joueurs});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
    if (json['joueurs'] != null) {
      joueurs = <Utilisateur>[];
      json['joueurs'].forEach((v) {
        joueurs!.add(new Utilisateur.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    if (this.joueurs != null) {
      data['joueurs'] = this.joueurs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}