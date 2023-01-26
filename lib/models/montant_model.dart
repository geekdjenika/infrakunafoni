class Montant {
  int? id;
  int? montant;
  String? devise;

  Montant({this.id, this.montant, this.devise});

  Montant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    montant = json['montant'];
    devise = json['devise'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['montant'] = this.montant;
    data['devise'] = this.devise;
    return data;
  }
}
