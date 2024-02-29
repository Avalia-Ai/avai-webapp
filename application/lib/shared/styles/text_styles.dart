import 'package:avalia_ai/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class AVAITextStyle {
  final Color color;

  AVAITextStyle({Color? color}) : color = color ?? AVAIColors.darkGrey;

  TextStyle get title => TextStyle(
        fontSize: 18,
        color: color,
        fontWeight: FontWeight.w600,
      );

  TextStyle get subtitle => TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: FontWeight.w400,
      );

  TextStyle get label => TextStyle(
        fontSize: 14,
        color: color,
        fontWeight: FontWeight.w300,
      );

  TextStyle get content => TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: FontWeight.w400,
      );

  TextStyle get mediumContent => TextStyle(
        fontSize: 16,
        color: color,
        fontWeight: FontWeight.w500,
      );

  TextStyle get boldContent => TextStyle(
        fontSize: 18,
        color: color,
        fontWeight: FontWeight.w600,
      );

  TextStyle get semiBoldContent => TextStyle(
        fontSize: 18,
        color: color,
        fontWeight: FontWeight.w600,
      );

  TextStyle get placeholder => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AVAIColors.grey,
      );

  TextStyle get link => TextStyle(
        fontSize: 16,
        color: color,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w600,
      );

  TextStyle get action => TextStyle(
        fontSize: 18,
        color: color,
        fontWeight: FontWeight.w500,
      );
}
