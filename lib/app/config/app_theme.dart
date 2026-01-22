import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'app_constants.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryOrange = Color(0xFFF85E11);
  static const Color primaryYellow = Color(0xFFe7b000);
  static const Color secondaryGreen = Color(0xFF94BE2C);
  static const Color textPrimary = Color(0xFF2E2E2E);
  static const Color textSecondary = Color(0xFF6F6F6F);
  static const Color textGray = Color(0xFF808080);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color background = Color(0xFFF8F8F8);
  static const Color cream = Color(0xFFFFF7E8);
  static const Color shadow = Color(0x14000000);
  static const Color border = Color(0xFFE6E6E6);
  static const Color peachLight = Color(0xFFFFF3EA);
  static const Color transparent = Color(0x00000000);
  static const Color textHint = Color(0xFF696969);

  static ThemeData get lightTheme => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: surface,
    primaryColor: primaryOrange,
    fontFamily: 'HelveticaNeue',
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryOrange,
      brightness: Brightness.light,
      primary: primaryOrange,
      secondary: secondaryGreen,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: surface,
      foregroundColor: textPrimary,
      elevation: 0,
      toolbarHeight: 12.w,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: textPrimary,
      ),
      iconTheme: IconThemeData(color: primaryOrange, size: 5.w),
      actionsIconTheme: IconThemeData(color: primaryOrange, size: 4.2.w),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        color: textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: textSecondary,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: background,
      hintStyle: TextStyle(color: textSecondary, fontSize: 11.sp),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.inputRadius),
        borderSide: BorderSide.none,
      ),
    ),
  );

  static const TextStyle buttonText = TextStyle(
    fontWeight: FontWeight.w700,
    color: white,
  );
}
