import 'package:material_ui/material_ui.dart';

class AppColors {
  static const Color background = Color(0xFF111214);
  static const Color surface = Color(0xFF1C1D21);
  static const Color drawerBg = Color(0xFF16171A);

  static const Color pastelYellow = Color(0xFFF9F568);
  static const Color pastelGreen = Color(0xFF9EE5A5);
  static const Color pastelBlue = Color(0xFFB2E4FA);
  static const Color pastelCream = Color(0xFFFAF5DD);

  // Warna teks
  static const Color textDark = Color(0xFF111214);
  static const Color textDarkSecondary = Color(0xFF2B2C30);
  static const Color textLight = Colors.white;
  static const Color textMuted = Colors.white54;
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.pastelYellow,
        onPrimary: AppColors.textDark,
        secondary: AppColors.pastelBlue,
        onSecondary: AppColors.textDark,
        surface: AppColors.surface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.pastelYellow,
        foregroundColor: AppColors.textDark,
        iconTheme: IconThemeData(
          color: AppColors.textDark,
        ), // Ikon drawer hitam
        elevation: 0,
        titleTextStyle: TextStyle(
          color: AppColors.textDark,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawerTheme: const DrawerThemeData(backgroundColor: AppColors.drawerBg),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: AppColors.pastelYellow,
            width: 1.5,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.pastelYellow,
          foregroundColor: AppColors.textDark,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
      useMaterial3: true,
    );
  }
}
