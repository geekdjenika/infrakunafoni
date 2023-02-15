import 'package:infrakunafoni/models/diacritic_model.dart';

extension DiacriticsAwareString on String {

  String get withoutDiacritics {
    final diacriticsMap = Diacritics().map;

    return splitMapJoin(
      '',
      onNonMatch: (char) => diacriticsMap.containsKey(char)
          ? diacriticsMap[char]
          : char,
    );
  }
}