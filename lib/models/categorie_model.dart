import 'package:infrakunafoni/models/amende_model.dart';

class Categorie {
  int? id;
  String? categorie;
  List<Amende>? amendes;

  Categorie({this.id, this.categorie, this.amendes});

  Categorie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categorie = json['categorie'];
    if (json['amendes'] != null) {
      amendes = <Amende>[];
      json['amendes'].forEach((v) {
        amendes!.add(new Amende.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categorie'] = this.categorie;
    if (this.amendes != null) {
      data['amendes'] = this.amendes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
