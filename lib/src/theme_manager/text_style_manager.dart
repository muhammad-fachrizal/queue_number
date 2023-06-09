import 'package:flutter/material.dart';

TextStyle getRubikTextStyle(
    {double fontSize = 16,
    fontWeight = FontWeight.normal,
    color = Colors.black}) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'Rubik');
}
