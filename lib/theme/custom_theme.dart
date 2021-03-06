import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_color.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: CustomColor.primaryColor,
      fontFamily: 'Poppins',
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: CustomColor.blackTextColor,
        ),
        bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: CustomColor.greyTextColor,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: CustomColor.blackTextColor,
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      primarySwatch: CustomColor.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: CustomColor.primaryColor,
          elevation: 0,
          onPrimary: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          onSurface: CustomColor.disabledButtonColor,
          minimumSize: const Size(double.infinity, 50),
          
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: CustomColor.darkBackgroundColor,
      primaryColor: CustomColor.primaryColor,
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        bodyText1: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: CustomColor.greyTextColor,
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      primarySwatch: CustomColor.black,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: CustomColor.primaryColor,
          elevation: 0,
          onPrimary: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          onSurface: CustomColor.disabledButtonColor,
          minimumSize: const Size(double.infinity, 50)
        ),
      ),
    );
  }
}
