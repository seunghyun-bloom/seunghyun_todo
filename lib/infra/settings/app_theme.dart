import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  static AppThemeColors get colors => AppThemeColors();
  static AppThemeFontWeights get fontWeights => AppThemeFontWeights();
  static AppThemeTextStyles get textStyles => AppThemeTextStyles();

  static double get bottomInset {
    return MediaQuery.of(Get.context!).viewPadding.bottom > 0 ? 4 : 20;
  }

  static bool get isKeyboardOpen {
    return MediaQuery.of(Get.context!).viewInsets.bottom > 0;
  }

  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppTheme.colors.black,
      ),
      primaryColor: AppTheme.colors.black,
      secondaryHeaderColor: AppTheme.colors.black,
      appBarTheme: AppBarTheme(
        titleTextStyle: AppTheme.textStyles.semibold20Black,
        surfaceTintColor: Colors.transparent,
        color: AppTheme.colors.white,
        centerTitle: true,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.black.withOpacity(0.1),
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppTheme.colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateColor.resolveWith(
            (states) => AppTheme.colors.black,
          ),
          overlayColor: WidgetStateColor.resolveWith(
            (states) => AppTheme.colors.black.withOpacity(0.1),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStateColor.resolveWith(
            (states) => AppTheme.colors.black.withOpacity(0.7),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          overlayColor: WidgetStateColor.resolveWith(
            (states) => AppTheme.colors.black.withOpacity(0.1),
          ),
        ),
      ),
      scaffoldBackgroundColor: AppTheme.colors.white,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppTheme.colors.black,
            displayColor: AppTheme.colors.black,
          ),
    );
  }
}

class AppThemeColors {
  Color green = const Color(0xFF00cc60); // main1
  Color deepGreen = const Color(0xFF00a700); //  main2
  Color orange = const Color(0xFFff9f23); //  main3
  Color yellow = const Color(0xffffdf20); //  main4
  Color black = const Color(0xFF111111); //  sec1
  Color gray = const Color(0xFF767676); //  sec2
  Color lightGray = const Color(0xFFeeeeee); //  sec3
  Color red = const Color(0xFFFF0000); //  sec4
  Color deepNavy = const Color(0xFF1A1C23); //  sec5
  Color white = Colors.white;
}

class AppThemeFontWeights {
  final FontWeight thin = FontWeight.w100;
  final FontWeight extraLight = FontWeight.w200;
  final FontWeight light = FontWeight.w300;

  final FontWeight regular = FontWeight.w400;
  final FontWeight medium = FontWeight.w500;
  final FontWeight semiBold = FontWeight.w600;

  final FontWeight bold = FontWeight.w700;
  final FontWeight extraBold = FontWeight.w800;
  final FontWeight black = FontWeight.w900;
}

class AppThemeTextStyles {
  final TextStyle regular10Black = TextStyle(
    fontWeight: AppThemeFontWeights().regular,
    fontSize: 10,
    color: AppThemeColors().black,
  );

  final TextStyle regular10Gray = TextStyle(
    fontWeight: AppThemeFontWeights().regular,
    fontSize: 10,
    color: AppThemeColors().gray,
  );

  final TextStyle regular12Black = TextStyle(
    fontWeight: AppThemeFontWeights().regular,
    fontSize: 12,
    color: AppThemeColors().black,
  );

  final TextStyle regular12White = TextStyle(
    fontWeight: AppThemeFontWeights().regular,
    fontSize: 12,
    color: AppThemeColors().white,
  );

  final TextStyle regular12Gray = TextStyle(
    fontWeight: AppThemeFontWeights().regular,
    fontSize: 12,
    color: AppThemeColors().gray,
  );

  final TextStyle regular14Gray = TextStyle(
    fontWeight: AppThemeFontWeights().regular,
    fontSize: 14,
    color: AppThemeColors().gray,
  );

  final TextStyle regular14Black = TextStyle(
    fontWeight: AppThemeFontWeights().regular,
    fontSize: 14,
    color: AppThemeColors().black,
  );

  final TextStyle regular14 = TextStyle(
    fontWeight: AppThemeFontWeights().regular,
    fontSize: 14,
  );

  final TextStyle medium12 = TextStyle(
    fontWeight: AppThemeFontWeights().medium,
    fontSize: 12,
  );

  final TextStyle medium12Black = TextStyle(
    fontWeight: AppThemeFontWeights().medium,
    fontSize: 12,
    color: AppThemeColors().black,
  );

  final TextStyle medium14Black = TextStyle(
    fontWeight: AppThemeFontWeights().medium,
    fontSize: 14,
    color: AppThemeColors().black,
  );

  final TextStyle medium14Gray = TextStyle(
    fontWeight: AppThemeFontWeights().medium,
    fontSize: 14,
    color: AppThemeColors().gray,
  );

  final TextStyle medium16 = TextStyle(
    fontWeight: AppThemeFontWeights().medium,
    fontSize: 16,
  );

  final TextStyle medium16White = TextStyle(
    fontWeight: AppThemeFontWeights().medium,
    fontSize: 16,
    color: Colors.white,
  );

  final TextStyle semibold14White = TextStyle(
    fontSize: 14,
    fontWeight: AppTheme.fontWeights.semiBold,
    color: AppTheme.colors.white,
  );

  final TextStyle semibold14Green = TextStyle(
    fontSize: 14,
    fontWeight: AppTheme.fontWeights.semiBold,
    color: AppTheme.colors.green,
  );

  final TextStyle semibold14Gray = TextStyle(
    fontSize: 14,
    fontWeight: AppTheme.fontWeights.semiBold,
    color: AppTheme.colors.gray,
  );

  final TextStyle semibold16 = TextStyle(
    fontSize: 16,
    fontWeight: AppTheme.fontWeights.semiBold,
  );

  final TextStyle semibold16Black = TextStyle(
    fontSize: 16,
    fontWeight: AppTheme.fontWeights.semiBold,
    color: AppTheme.colors.black,
  );

  final TextStyle semibold16White = TextStyle(
    fontSize: 16,
    fontWeight: AppTheme.fontWeights.semiBold,
    color: AppTheme.colors.white,
  );

  final TextStyle semibold16Green = TextStyle(
    fontSize: 16,
    fontWeight: AppTheme.fontWeights.semiBold,
    color: AppTheme.colors.green,
  );

  final TextStyle semibold18 = TextStyle(
    fontSize: 18,
    fontWeight: AppTheme.fontWeights.semiBold,
  );

  final TextStyle semibold18Black = TextStyle(
    fontSize: 18,
    fontWeight: AppTheme.fontWeights.semiBold,
    color: AppTheme.colors.black,
  );

  final TextStyle semibold20Black = TextStyle(
    fontSize: 20,
    fontWeight: AppTheme.fontWeights.semiBold,
    color: AppTheme.colors.black,
  );

  final TextStyle semibold20White = TextStyle(
    fontSize: 20,
    fontWeight: AppTheme.fontWeights.semiBold,
    color: AppTheme.colors.white,
  );

  final TextStyle semibold24 = TextStyle(
    fontWeight: AppThemeFontWeights().semiBold,
    fontSize: 24,
  );

  final TextStyle semibold28Black = TextStyle(
    fontSize: 28,
    fontWeight: AppTheme.fontWeights.semiBold,
    color: AppTheme.colors.black,
  );

  final TextStyle semibold32Black = TextStyle(
    fontSize: 32,
    fontWeight: AppTheme.fontWeights.semiBold,
    color: AppTheme.colors.black,
  );
}
