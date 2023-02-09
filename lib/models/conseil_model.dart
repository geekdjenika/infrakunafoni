import 'package:infrakunafoni/models/infraction_model.dart';
import 'package:infrakunafoni/models/vocal_model.dart';

class Conseil {
  int? id;
  String? conseil;
  List<Vocal>? vocals;
  List<Infraction>? infractions;

  Conseil({this.id, this.conseil, this.vocals, this.infractions});

  Conseil.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    conseil = json['conseil'];
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
    data['conseil'] = this.conseil;
    if (this.vocals != null) {
      data['vocals'] = this.vocals!.map((v) => v.toJson()).toList();
    }
    if (this.infractions != null) {
      data['infractions'] = this.infractions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
