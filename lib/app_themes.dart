import 'package:expenses_tracking_app/consts/color_consts.dart';
import 'package:flutter/material.dart';

class AppThemes {

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: ColorConsts.white,
    colorScheme: const ColorScheme.light(),
    primaryColor: ColorConsts.blueAccent, 
    backgroundColor: ColorConsts.blueAccent,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorConsts.blueAccent,
    ), 
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide( 
          color: ColorConsts.blueAccent,
          style: BorderStyle.solid
        ),
        borderRadius: BorderRadius.circular(10) 
      ),
    ), 
    textSelectionTheme: const TextSelectionThemeData(cursorColor: ColorConsts.blueAccent)
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorConsts.black,
    colorScheme: const ColorScheme.dark(),
    primaryColor: ColorConsts.white,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorConsts.white,
    ), 
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide( 
          color: ColorConsts.blueAccent,
          style: BorderStyle.solid
        ),
        borderRadius: BorderRadius.circular(10) 
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: ColorConsts.blueAccent)
  ); 

  static TextTheme getTextTheme({required bool isDark}) {
    return const TextTheme(
      // appBarLabel
      subtitle1: TextStyle( 
        fontWeight: FontWeight.w500, 
      ),
      // buttonLabelStyle
      subtitle2: TextStyle( 
        fontWeight: FontWeight.w600, 
      ), 
      // product shortcut style
      headline1: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 16,
        fontWeight: FontWeight.w400, 
      ),
      // product info
      headline2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,  
      ),
      // alternatives
      headline3: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500, 
      ),
      // font size 16
      headline4: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500, 
      ),
      // block title (noncl. + click. + block subtitle)
      headline5: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w400, 
      ),
      // font size 18
      headline6: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500, 
      ),
    ).apply(
      bodyColor: isDark ? ColorConsts.white : ColorConsts.black,
      displayColor: isDark ? ColorConsts.white : ColorConsts.black, 
    );
  } 
}