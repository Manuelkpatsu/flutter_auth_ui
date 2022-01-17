import 'package:flutter/material.dart';

class CustomColor {
  static const MaterialColor white = MaterialColor(
    0xffffffff,
    <int, Color>{
      50: Color(0xffe6e6e6),
      100: Color(0xffcccccc),
      200: Color(0xffb3b3b3),
      300: Color(0xff999999),
      400: Color(0xff808080),
      500: Color(0xff666666),
      600: Color(0xff4c4c4c),
      700: Color(0xff333333),
      800: Color(0xff191919),
      900: Color(0xff000000),
    },
  );

  static const MaterialColor black = MaterialColor(
    0xff0c0f18,
    <int, Color>{
      50: Color(0xff0b0e16),
      100: Color(0xff0a0c13),
      200: Color(0xff080b11),
      300: Color(0xff07090e),
      400: Color(0xff06080c),
      500: Color(0xff05060a),
      600: Color(0xff040407),
      700: Color(0xff020305),
      800: Color(0xff010102),
      900: Color(0xff000000),
    },
  );

  static const Color primaryColor = Color(0xffff1654);
  static const Color greyButtonColor = Color(0xffd9dde2);
  static const Color greyTextColor = Color(0xffabb4bd);
  static const Color blackTextColor = Color(0xff1d2029);
  static const Color darkBackgroundColor = Color(0xff0c0f18);
}
