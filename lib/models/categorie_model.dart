class Categorie {
  int? id;
  String? categorie;

  Categorie({this.id, this.categorie});

  Categorie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categorie = json['categorie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categorie'] = this.categorie;
    return data;
  }
}
