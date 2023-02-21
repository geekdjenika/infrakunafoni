import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infrakunafoni/extensions/extension.dart';
import 'package:infrakunafoni/models/amende_model.dart';
import 'package:infrakunafoni/models/categorie_model.dart';
import 'package:infrakunafoni/models/infraction_model.dart';

Color correct = '#3F72AF'.toColor();
Color incorrect = '#E3001B'.toColor();
Color neutral = Colors.teal.shade100;
Color background = '#3F72AF'.toColor();

TextStyle titre(Color? color) {
  return GoogleFonts.montserrat(
    fontSize: 24.0,
    color: color
 );
}
TextStyle titregras(Color? color) {
  return GoogleFonts.montserrat(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: color
  );
}
TextStyle soustitre(Color? color) {
  return GoogleFonts.montserrat(
      fontSize: 16.0,
      color: color
  );
}
TextStyle soustitregras(Color? color) {
  return GoogleFonts.montserrat(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: color
  );
}
TextStyle texticon(Color? color) {
  return GoogleFonts.montserrat(
      fontSize: 8.0,
      fontWeight: FontWeight.bold,
      color: color
  );
}

TextStyle titreliste(Color? color) {
  return GoogleFonts.montserrat(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: color
  );
}

TextStyle soustitreliste(Color? color) {
  return GoogleFonts.montserrat(
      fontSize: 12.0,
      color: color
  );
}

TextStyle score(Color? color) {
  return GoogleFonts.montserrat(
      fontSize: 60.0,
      fontWeight: FontWeight.bold,
      color: color
  );
}

int selectedPageIndex = 1;

bool useindex = false;

List<Amende> amendes = [];

List<Infraction> infractions = [];

List<Categorie> categorie = [];

String nomcategorie = '';

String host = 'http://192.168.47.151:8080/api';
//String host = 'http://10.175.48.113:8080/api';

//auth
bool connexion = true;
bool connecte = false;
String token = '';
int id = 0;
String photo = '';



