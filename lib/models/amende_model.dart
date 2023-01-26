import 'package:infrakunafoni/models/vocal_model.dart';

import 'categorie_model.dart';
import 'montant_model.dart';

class Amende {
  int? id;
  Categorie? categorie;
  Montant? montant;
  List<Vocal>? vocals;

  Amende({this.id, this.categorie, this.montant, this.vocals});

  Amende.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categorie = json['categorie'] != null
        ? new Categorie.fromJson(json['categorie'])
        : null;
    montant =
    json['montant'] != null ? new Montant.fromJson(json['montant']) : null;
    if (json['vocals'] != null) {
      vocals = <Vocal>[];
      json['vocals'].forEach((v) {
        vocals!.add(new Vocal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.categorie != null) {
      data['categorie'] = this.categorie!.toJson();
    }
    if (this.montant != null) {
      data['montant'] = this.montant!.toJson();
    }
    if (this.vocals != null) {
      data['vocals'] = this.vocals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
