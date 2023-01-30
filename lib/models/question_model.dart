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
        mauvaisesReponses!.add(Reponse.fromJson(v));
      });
    }
    utilisateur = json['utilisateur'] != null
        ? Utilisateur.fromJson(json['utilisateur'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['reponse'] = reponse;
    if (mauvaisesReponses != null) {
      data['mauvaisesReponses'] =
          mauvaisesReponses!.map((v) => v.toJson()).toList();
    }
    if (utilisateur != null) {
      data['utilisateur'] = utilisateur!.toJson();
    }
    return data;
  }
}
