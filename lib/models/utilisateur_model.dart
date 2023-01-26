
import 'package:infrakunafoni/models/role_model.dart';

import 'notification_model.dart';

class Utilisateur {
  int? id;
  String? username;
  String? email;
  String? password;
  String? image;
  List<Notification>? notifications;
  List<Role>? roles;

  Utilisateur(
      {this.id,
        this.username,
        this.email,
        this.password,
        this.image,
        this.notifications,
        this.roles});

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
    return data;
  }
}
