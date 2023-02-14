import 'package:infrakunafoni/models/notification_model.dart';
import 'package:infrakunafoni/models/role_model.dart';
import 'package:infrakunafoni/models/sessionjeu_model.dart';

class Utilisateur {
  int? id;
  String? username;
  String? email;
  String? password;
  String? image;
  List<Notification>? notifications;
  List<Role>? roles;
  List<SessionJeu>? sessionJeux;

  Utilisateur(
      {this.id,
        this.username,
        this.email,
        this.password,
        this.image,
        this.notifications,
        this.roles,
        this.sessionJeux});

  Utilisateur.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    if (json['notifications'] != null) {
      notifications = <Notification>[];
      json['notifications'].forEach((v) {
        notifications!.add(new Notification.fromJson(v));
      });
    }
    if (json['roles'] != null) {
      roles = <Role>[];
      json['roles'].forEach((v) {
        roles!.add(new Role.fromJson(v));
      });
    }
    if (json['sessionJeux'] != null) {
      sessionJeux = <SessionJeu>[];
      json['sessionJeux'].forEach((v) {
        sessionJeux!.add(new SessionJeu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['image'] = this.image;
    if (this.notifications != null) {
      data['notifications'] =
          this.notifications!.map((v) => v.toJson()).toList();
    }
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    if (this.sessionJeux != null) {
      data['sessionJeux'] = this.sessionJeux!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  /*factory Utilisateur.fromMap(Map utilisateurMap){
    return Utilisateur(
        id: utilisateurMap['id'],
        username: utilisateurMap['username'],
        email: utilisateurMap['email'],
        password: utilisateurMap['password'],
        image: utilisateurMap['image'],
        notifications: utilisateurMap['notifications'],
        roles: utilisateurMap['roles'],
        sessionJeux: utilisateurMap['sessionJeux'],
    );
  }*/

}