import 'package:infrakunafoni/models/reponse_model.dart';
import 'package:infrakunafoni/models/utilisateur_model.dart';

class Question {
  final int id;

  final String question;

  final Map<String, bool> options;

  Question({required this.id,required this.question,required this.options});

}

class Questions {
  int? id;
  String? question;
  String? reponse;
  List<Reponse>? mauvaisesReponses;
  Utilisateur? utilisateur;

  Questions(
      {this.id,
        this.question,
        this.reponse,
        this.mauvaisesReponses,
        this.utilisateur});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    reponse = json['reponse'];
    if (json['mauvaisesReponses'] != null) {
      mauvaisesReponses = <Reponse>[];
      json['mauvaisesReponses'].forEach((v) {
        mauvaisesReponses!.add(new Reponse.fromJson(v));
      });
    }
    utilisateur = json['utilisateur'] != null
        ? new Utilisateur.fromJson(json['utilisateur'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['reponse'] = this.reponse;
    if (this.mauvaisesReponses != null) {
      data['mauvaisesReponses'] =
          this.mauvaisesReponses!.map((v) => v.toJson()).toList();
    }
    if (this.utilisateur != null) {
      data['utilisateur'] = this.utilisateur!.toJson();
    }
    return data;
  }
}
