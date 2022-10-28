import 'package:flutter/material.dart';
import 'package:image_uploader/utils/text_dimensions.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      primaryColor: Colors.blue,
    cardColor:  Colors.grey.withOpacity(0.4),
      backgroundColor: Colors.white,
      dividerColor: Colors.black,
      canvasColor:Colors.black,
      dialogBackgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          textTheme: TextTheme(headline1: TextStyle(color: Colors.black))),
    buttonColor: Colors.black
  );
  final darkTheme = ThemeData.dark().copyWith(
      dialogBackgroundColor:TextDimension.darkBlue ,
  dividerColor:  Colors.grey.withOpacity(0.8),
  brightness: Brightness.dark,
  cardColor:  Colors.black.withOpacity(0.4),
  backgroundColor: TextDimension.darkNavyBlue,
canvasColor:TextDimension.darkBlue,
  primaryColor: TextDimension.darkNavyBlue, appBarTheme: AppBarTheme(

      textTheme: TextTheme(headline1: TextStyle(color: Colors.white))),buttonColor: Colors.white,
  bottomAppBarColor: TextDimension.middleShadeNavyBlue);
}
