import 'package:infrakunafoni/models/infraction_model.dart';
import 'package:infrakunafoni/models/montant_model.dart';
import 'package:infrakunafoni/models/vocal_model.dart';

class Amende {
  int? id;
  Montant? montant;
  List<Vocal>? vocals;
  List<Infraction>? infractions;

  Amende({this.id, this.montant, this.vocals, this.infractions});

  Amende.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    montant =
    json['montant'] != null ? new Montant.fromJson(json['montant']) : null;
    if (json['vocals'] != null) {
      vocals = <Vocal>[];
      json['vocals'].forEach((v) {
        vocals!.add(new Vocal.fromJson(v));
      });
    }
    if (json['infractions'] != null) {
      infractions = <Infraction>[];
      json['infractions'].forEach((v) {
        infractions!.add(new Infraction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.montant != null) {
      data['montant'] = this.montant!.toJson();
    }
    if (this.vocals != null) {
      data['vocals'] = this.vocals!.map((v) => v.toJson()).toList();
    }
    if (this.infractions != null) {
      data['infractions'] = this.infractions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
