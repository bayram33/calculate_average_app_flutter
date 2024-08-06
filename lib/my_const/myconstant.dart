import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class MyConstant {
  static const MaterialColor mainColor = Colors.deepOrange;
  static const String nameOftitle = "Calculate the Notes";
  static final TextStyle styleProp = GoogleFonts.tillana(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: mainColor,
  );
  static BorderRadius borderRadius = BorderRadius.circular(24);
  static BorderRadius borderRadiusDrop = BorderRadius.circular(10);

  static const TextStyle sizeOfAverage = TextStyle(
    fontSize: 30,
    color: MyConstant.mainColor,
  );

  static final TextStyle averageText = GoogleFonts.tillana(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: mainColor,
  );

  static const EdgeInsets paddingDrop = EdgeInsets.symmetric(horizontal: 10);
}
