import 'package:flutter/cupertino.dart';
import 'package:infrakunafoni/constants.dart';
import 'package:infrakunafoni/models/utilisateur_model.dart';
import 'package:infrakunafoni/services/auth/utilisateur_service.dart';

class UtilisateurProvider extends ChangeNotifier {
  List<Utilisateur> utilisateurs = [];

  /*void getUser() async {
    utilisateurs = await utilisateurService.getUser(id);
  }*/

}