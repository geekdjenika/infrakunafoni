import 'langue_model.dart';

class Vocal {
  int? id;
  String? vocal;
  Langue? langue;

  Vocal({this.id, this.vocal, this.langue});

  Vocal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vocal = json['vocal'];
    langue =
    json['langue'] != null ? new Langue.fromJson(json['langue']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vocal'] = this.vocal;
    if (this.langue != null) {
      data['langue'] = this.langue!.toJson();
    }
    return data;
  }
}
