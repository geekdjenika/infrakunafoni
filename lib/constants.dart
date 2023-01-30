import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infrakunafoni/extensions/extension.dart';
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
      fontSize: 16.0,
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

int selectedPageIndex = 1;

bool useindex = false;

List<Infraction> infractions = [];



