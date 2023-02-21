class SessionJeu {
  int? id;
  String? date;
  int? points;

  SessionJeu({this.id, this.date, this.points});

  SessionJeu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['points'] = this.points;
    return data;
  }
}
