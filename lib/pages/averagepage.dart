import "package:app/my_const/myconstant.dart";
import "package:flutter/material.dart";

class AveragePage extends StatelessWidget {
  final double average;
  final int lessonCount;

  const AveragePage(
      {super.key, required this.average, required this.lessonCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          lessonCount > 0 ? "$lessonCount ders girildi" : "ders seçiniz",
          style: MyConstant.averageText,
        ),
        Text(
          lessonCount == 0 ? "0" : average.toStringAsFixed(2),
          style: MyConstant.sizeOfAverage,
        ),
        Text(
          "Ortalama",
          style: MyConstant.averageText,
        ),
      ],
    );
  }
}
