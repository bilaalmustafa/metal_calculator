import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static Color primaryColor = const Color(0xFFE57A44);
  static Color secondaryColor = const Color(0xFF03DAC6);
  static Color scaffoldBackgroundColor = const Color(0xFFFAFBFF);
  static Color appBarTextColor = const Color(0xffFFFFFF);
  static Color textColor = const Color(0xFF000000);
  static Color bodyTextColour = const Color(0xff000000);
  static Color accentColor = const Color(0xFF03DAC5);
  static Color containerColor = const Color(0xffFFFFFF);
  static Color boxShadowColor = const Color(0xff000000).withOpacity(0.25);
  static Color buttonColor1 = const Color(0xffFF9C6A);
  static Color buttonColor2 = const Color(0xffCA581F);
  static Color iconsColors = Colors.red;
  static Color hintsTextColor = const Color(0xffB4B2B2);
  static Color costContainersColor = const Color(0xffF6F6F6);

  //this is the charts colours
  static Color mainTextColor1 = Colors.white;
  static Color mainTextColor2 = Colors.white70;
  static Color mainTextColor3 = Colors.white38;
  static Color mainGridLineColor = Colors.white10;
  static Color borderColor = Colors.white54;
  static Color gridLinesColor = const Color(0x11FFFFFF);

  static Color contentColorBlack = Colors.black;
  static Color contentColorWhite = Colors.white;
  static Color contentColorBlue = const Color(0xFF2196F3);
  static Color contentColorYellow = const Color(0xFFFFC300);
  static Color contentColorOrange = const Color(0xFFFF683B);
  static Color contentColorGreen = const Color(0xFF3BFF49);
  static Color contentColorPurple = const Color(0xFF6E1BFF);
  static Color contentColorPink = const Color(0xFFFF3AF2);
  static Color contentColorRed = const Color(0xFFE80054);
  static Color contentColorCyan = const Color(0xFF50E4FF);

  static LinearGradient buttonGradient = LinearGradient(
    colors: [buttonColor2, buttonColor1],
  );

  static LinearGradient primaryGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 10, 10, 10),
      Color.fromARGB(255, 86, 88, 88),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppTextStyles {
  static final TextStyle appBar = GoogleFonts.montserrat(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.appBarTextColor,
  );
  static final TextStyle texField = GoogleFonts.montserrat(
    fontSize: 13.0,
    color: AppColors.hintsTextColor,
  );

  static final TextStyle displayLarge = GoogleFonts.montserrat(
    fontSize: 57.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static final TextStyle displayMedium = GoogleFonts.montserrat(
    fontSize: 45.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static final TextStyle displaySmall = GoogleFonts.montserrat(
    fontSize: 36.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static final TextStyle headlineLarge = GoogleFonts.montserrat(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static final TextStyle headlineMedium = GoogleFonts.montserrat(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static final TextStyle headlineSmall = GoogleFonts.montserrat(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );

  static final TextStyle titleLarge = GoogleFonts.montserrat(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static final TextStyle titleMedium = GoogleFonts.montserrat(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static final TextStyle titleSmall = GoogleFonts.montserrat(
    fontSize: 14.0,
    color: AppColors.mainTextColor1,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle bodyLarge = GoogleFonts.montserrat(
    fontSize: 16.0,
    color: AppColors.textColor,
  );

  static final TextStyle bodyMedium = GoogleFonts.montserrat(
    fontSize: 14.0,
    color: AppColors.textColor,
  );

  static final TextStyle bodySmall = GoogleFonts.montserrat(
      fontSize: 12.0,
      color: AppColors.bodyTextColour,
      fontWeight: FontWeight.w400);

  static final TextStyle labelLarge = GoogleFonts.montserrat(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle labelMedium = GoogleFonts.montserrat(
    fontSize: 12.0,
    color: AppColors.buttonColor1,
  );

  static final TextStyle labelSmall = GoogleFonts.montserrat(
    fontSize: 11.0,
    color: AppColors.bodyTextColour,
  );
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
      },
    ),
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge,
      displayMedium: AppTextStyles.displayMedium,
      displaySmall: AppTextStyles.displaySmall,
      headlineLarge: AppTextStyles.headlineLarge,
      headlineMedium: AppTextStyles.headlineMedium,
      headlineSmall: AppTextStyles.headlineSmall,
      titleLarge: AppTextStyles.titleLarge,
      titleMedium: AppTextStyles.titleMedium,
      titleSmall: AppTextStyles.titleSmall,
      bodyLarge: AppTextStyles.bodyLarge,
      bodyMedium: AppTextStyles.bodyMedium,
      bodySmall: AppTextStyles.bodySmall,
      labelLarge: AppTextStyles.labelLarge,
      labelMedium: AppTextStyles.labelMedium,
      labelSmall: AppTextStyles.labelSmall,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.buttonColor1,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppTextStyles.labelLarge,
        backgroundColor: AppColors.buttonColor1,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: AppColors.primaryColor,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.white,
      ),
      iconTheme: IconThemeData(color: AppColors.scaffoldBackgroundColor),
      titleTextStyle: AppTextStyles.appBar,
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  );

  static ThemeData darkTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
      },
    ),
    primaryColor: AppColors.primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      displayLarge: AppTextStyles.displayLarge.copyWith(color: Colors.white),
      displayMedium: AppTextStyles.displayMedium.copyWith(color: Colors.white),
      displaySmall: AppTextStyles.displaySmall.copyWith(color: Colors.white),
      headlineLarge: AppTextStyles.headlineLarge.copyWith(color: Colors.white),
      headlineMedium:
          AppTextStyles.headlineMedium.copyWith(color: Colors.white),
      headlineSmall: AppTextStyles.headlineSmall.copyWith(color: Colors.white),
      titleLarge: AppTextStyles.titleLarge.copyWith(color: Colors.white),
      titleMedium: AppTextStyles.titleMedium.copyWith(color: Colors.white),
      titleSmall: AppTextStyles.titleSmall.copyWith(color: Colors.white),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(color: Colors.white),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(color: Colors.white),
      bodySmall: AppTextStyles.bodySmall.copyWith(color: Colors.white),
      labelLarge: AppTextStyles.labelLarge.copyWith(color: Colors.white),
      labelMedium: AppTextStyles.labelMedium.copyWith(color: Colors.white),
      labelSmall: AppTextStyles.labelSmall.copyWith(color: Colors.white),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.buttonColor1,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: AppTextStyles.labelLarge,
        backgroundColor: AppColors.buttonColor1,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.primaryColor,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.black,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: AppTextStyles.appBar.copyWith(color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.black,
  );
}
