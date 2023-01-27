class Reponse {
  int? id;
  String? reponse;

  Reponse({this.id, this.reponse});

  Reponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reponse = json['reponse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reponse'] = this.reponse;
    return data;
  }
}
