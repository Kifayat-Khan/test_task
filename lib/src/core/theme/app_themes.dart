import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_task/src/core/theme/app_pallet.dart';

class AppThemes {
  static appInputBorder({
    Color color = AppPallet.gray,
  }) =>
      OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(2),
      );

  ///light theme
  static ThemeData light = ThemeData.light().copyWith(
    primaryColor: AppPallet.primary,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppPallet.white,
    ),
    applyElevationOverlayColor: true,
    // cardTheme: CardTheme(
    //   color: AppPallet.secondaryColor.withOpacity(0.5),
    // ),
    scaffoldBackgroundColor: AppPallet.white,

    //--text theme

    textTheme: TextTheme(
      headlineLarge: GoogleFonts.playfairDisplay(
        color: AppPallet.primary,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: GoogleFonts.poppins(
        color: AppPallet.primary,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: GoogleFonts.poppins(
        color: AppPallet.primary,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: GoogleFonts.poppins(
        color: AppPallet.primary,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: GoogleFonts.poppins(
        color: AppPallet.primary,
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.poppins(
        color: AppPallet.gray,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),

    //--text field theme
    inputDecorationTheme: InputDecorationTheme(
      //labelStyle: ,

      focusColor: AppPallet.primary,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      border: appInputBorder(),
      focusedErrorBorder: appInputBorder(color: AppPallet.failureColor),
      focusedBorder: appInputBorder(color: AppPallet.primary),
      enabledBorder: appInputBorder(),
      hintStyle: GoogleFonts.openSans(
        color: AppPallet.gray,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
    ),

    focusColor: AppPallet.primary,
  );
}
