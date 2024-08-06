class Lesson {
  final String nameOfLesson;
  final double valueOfLetter;
  final double valueOfCredit;

  Lesson(
      {required this.nameOfLesson,
      required this.valueOfLetter,
      required this.valueOfCredit});

  @override
  String toString() {
    return "Ders adı => $nameOfLesson  Ders harf notu => $valueOfLetter  Ders kredi notu => $valueOfCredit";
  }
}
