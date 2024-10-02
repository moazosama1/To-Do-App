import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color bgColorLight = Color(0xffDFECDB);
  static const Color bgColorDark = Color(0xff060E1E);
  static const Color primaryColor = Color(0xff5D9CEC);
  static const Color onDarkColorDate = Color(0xff141922);
  static const Color onLightColorDate = Colors.white;

  static ThemeData lightTheme({required bool isArabic}) {
    return ThemeData(
      fontFamily: isArabic ? GoogleFonts.notoKufiArabic().fontFamily : GoogleFonts.poppins().fontFamily,
      useMaterial3: false,
      scaffoldBackgroundColor: bgColorLight,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: IconThemeData(
          color: primaryColor,
          size: 30,
        ),
        selectedItemColor: primaryColor,
        unselectedItemColor: Color(0xffC8C9CB),
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      colorScheme: ColorScheme.fromSeed(
        onSecondaryContainer: Colors.white,
        seedColor: primaryColor,
        primary: primaryColor,
        primaryContainer: Colors.white,
        secondary: Colors.white,
        onInverseSurface: primaryColor,
        primaryFixed: bgColorLight,
        onPrimaryContainer: primaryColor,
        onPrimary: onLightColorDate,
        onSecondary: const Color(0xff383838),
        inversePrimary: Colors.black,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(360),
          side: const BorderSide(
            color: Colors.white,
            width: 3,
          ),
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
          color: Colors.black,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: onLightColorDate,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
      ),
    );
  }

  static ThemeData darkTheme({required bool isArabic}) {
    return ThemeData(
      fontFamily: isArabic ? GoogleFonts.notoKufiArabic().fontFamily : GoogleFonts.poppins().fontFamily,
      useMaterial3: false,
      scaffoldBackgroundColor: bgColorDark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: IconThemeData(
          color: primaryColor,
          size: 30,
        ),
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        onSecondaryContainer:const Color(0xff060E1E),
        primaryFixed: bgColorDark,
        primary: primaryColor,
        onInverseSurface: Colors.white,
        primaryContainer: bgColorDark,
        secondary: onDarkColorDate,
        onPrimaryContainer: onDarkColorDate,
        onPrimary: Colors.white,
        onSecondary: const Color(0xff383838),
        inversePrimary: Colors.white,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(360),
          side: const BorderSide(
            color: onDarkColorDate,
            width: 3,
          ),
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 30,
          color: Color(0xff060E1E),
          fontWeight: FontWeight.w700,
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: onDarkColorDate,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
