import "dart:core";
import "package:app/model/lesson.dart";
import "package:flutter/material.dart";

class DataHelper {
  static List<String> _allLessonLetterList() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _letterToNumber(String letter) {
    switch (letter) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2;
      case "DC":
        return 1.5;
      case "DD":
        return 1;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> allLessonMenuItem() {
    return _allLessonLetterList()
        .map(
          (e) => DropdownMenuItem(
            value: _letterToNumber(e),
            child: Text(e),
          ),
        )
        .toList();
  }

  static List<int> _allCredit() {
    return [1,2,3,4,5,6];
  }

  static List<DropdownMenuItem<double>> allCreditMenuItem() {
    return _allCredit()
        .map(
          (e) => DropdownMenuItem<double>(
            value: e.toDouble(),
            child: Text("$e"),
          ),
        )
        .toList();
  }

  static List<Lesson> allAddedLesson = [];

  static addLesson(Lesson lesson) {
    allAddedLesson.add(lesson);
  }

  static double calcAverage() {
    double credit = 0;
    double allPoint = 0;

    for (var element in allAddedLesson) {
      allPoint = allPoint + (element.valueOfCredit * element.valueOfLetter);
      credit = credit + element.valueOfCredit;
    }

    return allPoint / credit;
  }
}
