import 'package:infrakunafoni/models/utilisateur_model.dart';
import 'package:infrakunafoni/models/vocal_model.dart';

import 'amende_model.dart';

class Infraction {
  int? id;
  String? description;
  String? reference;
  List<Vocal>? vocals;
  List<Amende>? amendes;
  Utilisateur? utilisateur;

  Infraction(
      {this.id,
        this.description,
        this.reference,
        this.vocals,
        this.amendes,
        this.utilisateur});

  Infraction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    reference = json['reference'];
    if (json['vocals'] != null) {
      vocals = <Vocal>[];
      json['vocals'].forEach((v) {
        vocals!.add(new Vocal.fromJson(v));
      });
    }
    if (json['amendes'] != null) {
      amendes = <Amende>[];
      json['amendes'].forEach((v) {
        amendes!.add(new Amende.fromJson(v));
      });
    }
    utilisateur = json['utilisateur'] != null
        ? new Utilisateur.fromJson(json['utilisateur'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['reference'] = this.reference;
    if (this.vocals != null) {
      data['vocals'] = this.vocals!.map((v) => v.toJson()).toList();
    }
    if (this.amendes != null) {
      data['amendes'] = this.amendes!.map((v) => v.toJson()).toList();
    }
    if (this.utilisateur != null) {
      data['utilisateur'] = this.utilisateur!.toJson();
    }
    return data;
  }
}
