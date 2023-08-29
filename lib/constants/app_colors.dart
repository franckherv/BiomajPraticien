import 'package:flutter/material.dart';

class AppColors {

  AppColors._();

  static const Color appThemeColor =  Color(0xff107E69);
  static const Color yelow = Color(0xffF1F4D0);
 static const Color grennlight =  Color(0xFF8CC63F);
 static const Color blur =  Color(0xFF83C3BE);
 static const Color jaune =  Color(0xFFE2CAA2);
 static const Color violet =  Color(0xFFCDBBEA);
  static const Color rose =  Color(0xFFEABBBB);
  static const Color greyBackgroundSurfaceColor = Color(0xFF107E69BE);
  // static const Color screenBackgroundColor =  Color(0xFFEDEDED);
  // static const Color inputLabelColor =  Color(0xFFC5C5C5);
  // static const Color greyLightColor = Color(0xFFEDEDED); 


  static const MaterialColor appMaterialColor = MaterialColor(
    _appThemeColorPrimaryValue,
    <int, Color>{
      50: Color(0xff107E69),
      100: Color(0xff107E69),
      200: Color(0xff107E69),
      300: Color(0xff107E69),
      400: Color(0xff107E69),
      500: Color(_appThemeColorPrimaryValue),
      600: Color(0xff107E69),
      700: Color(0xff107E69),
      800: Color(0xff107E69),
      900: Color(0xff107E69),
    },
  );
  static const int _appThemeColorPrimaryValue = 0xff107E69;


}


