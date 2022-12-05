import 'package:flutter/material.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.lightTheme: ThemeData(
      backgroundColor: EstiloApp.primarypink,
      primaryColor: EstiloApp.colorwhite,
      //hintColor: ,
      indicatorColor: EstiloApp.primarypink,
      fontFamily: 'Montserrat',
      iconTheme: IconThemeData(color: EstiloApp.primarypurple),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              shadowColor: EstiloApp.primarypurple,
              surfaceTintColor: EstiloApp.primarypurple,
              textStyle: TextStyle(decoration: TextDecoration.underline),
              foregroundColor: EstiloApp.primarypink[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)))),
      scaffoldBackgroundColor: EstiloApp.colorwhite,
      cardTheme: CardTheme(
          margin: EdgeInsets.all(10),
          surfaceTintColor: EstiloApp.colorwhite,
          elevation: 20,
          color: EstiloApp.colorwhite,
          shadowColor: EstiloApp.colorblack,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              elevation: 60,
              backgroundColor: EstiloApp.primarypurple,
              fixedSize: const Size(150, 120))),
      appBarTheme: AppBarTheme(
          backgroundColor: EstiloApp.primaryblue,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(shadows: kElevationToShadow[3])),
      inputDecorationTheme: InputDecorationTheme(
        errorStyle:
            TextStyle(color: EstiloApp.colorblack, fontSize: 10, height: 0.3),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: EstiloApp.primarypink),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: EstiloApp.primarypink),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: EstiloApp.primarypurple),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: EstiloApp.primarypink),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: EstiloApp.primarypurple),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        displayLarge: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        displaySmall: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        headlineMedium: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: EstiloApp.colorblack,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
    AppTheme.darkTheme: ThemeData(
        backgroundColor: EstiloApp.colorblack,
        primaryColor: EstiloApp.primaryblue,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: EstiloApp.primaryblue)),
        appBarTheme: AppBarTheme(backgroundColor: EstiloApp.colorblack))
  };
}

enum AppTheme { lightTheme, darkTheme }
