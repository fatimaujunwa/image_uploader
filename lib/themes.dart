import 'package:flutter/material.dart';
import 'package:image_uploader/text_dimensions.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.blue,
    cardColor:  Colors.grey.withOpacity(0.4),
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          textTheme: TextTheme(headline1: TextStyle(color: Colors.black))),
    buttonColor: Colors.black
  );
  final darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  cardColor:  Colors.black.withOpacity(0.4),
  backgroundColor: TextDimension.darkNavyBlue

  ,primaryColor: TextDimension.darkNavyBlue, appBarTheme: AppBarTheme(

      textTheme: TextTheme(headline1: TextStyle(color: Colors.white))),buttonColor: Colors.white,
  bottomAppBarColor: TextDimension.middleShadeNavyBlue);
}
