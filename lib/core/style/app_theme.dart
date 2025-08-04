import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      secondaryHeaderColor: AppColors.secondary,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          surface: AppColors.backgroundColor),
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      dividerColor: AppColors.outline,
      textTheme: const TextTheme(
        //headline1:
        displayMedium: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),
        //headline2:
        displaySmall: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),
        //headline3:
        headlineMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),

        // bodyText1:
        bodyMedium: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),

        // text inside all buttons
        bodyLarge: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            color: AppColors.textColor),

        //bodyText2:
        // for Text Field + Hint
        bodySmall: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),

        //caption:
        // error message
        labelLarge: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),

        labelMedium: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
            color: AppColors.textColor),
      ),
      // splashColor: AppColors.primary.withOpacity(.2),
    
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: AppColors.hintTextColor),
          labelStyle: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: AppColors.hintTextColor),
          floatingLabelStyle: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: AppColors.hintTextColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          
          errorStyle: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: AppColors.error),
          focusColor: AppColors.primary,
          filled: true,
          fillColor: AppColors.white,
          isDense: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide.none),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.error)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: AppColors.error)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 14)));
}
