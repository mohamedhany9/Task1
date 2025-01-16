
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:taskgithub/core/values/app_colors.dart';

class AppTextStyle {
  // Montserrat Light Fonts
  static TextStyle sfLight =  TextStyle(
      fontWeight: FontWeight.w300,
      color: ThemeColors.appColor,
      fontSize: 16,
      fontFamily: 'Sf');
  // Montserrat Regular Fonts
  static TextStyle sfRegular =  TextStyle(
      fontWeight: FontWeight.w400,
      color: ThemeColors.appColor,
      fontSize: 16,
      fontFamily: 'Sf');
  // Montserrat SemiBold Fonts
  static TextStyle sfSemiBold =  TextStyle(
      fontWeight: FontWeight.w600,
      color: ThemeColors.appColor,
      fontSize: 16,
      fontFamily: 'Sf');
  // Montserrat Bold Fonts
  static TextStyle sfBold =  TextStyle(
      fontWeight: FontWeight.w700,
      color: ThemeColors.appColor,
      fontSize: 16,
      fontFamily: 'Sf');
  // Montserrat Black Fonts
  static TextStyle sfBlack =  TextStyle(
      fontWeight: FontWeight.w900,
      color: ThemeColors.appColor,
      fontSize: 16,
      fontFamily: 'Sf');

  static TextStyle sfgray =  TextStyle(
      fontWeight: FontWeight.w400,
      color: HexColor("#616161"),
      fontSize: 14,
      fontFamily: 'Sf');
}
