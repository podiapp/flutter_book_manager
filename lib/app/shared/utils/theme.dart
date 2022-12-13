part of '../utils.dart';

class ProjectTheme {
  ProjectTheme._();

  static const AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: ProjectColors.blue,
    titleTextStyle: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  );

  static const FloatingActionButtonThemeData fabTheme =
      FloatingActionButtonThemeData(
    backgroundColor: ProjectColors.blue,
  );

  static const BottomNavigationBarThemeData bottomNavTheme =
      BottomNavigationBarThemeData(
    backgroundColor: ProjectColors.blue,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
  );

  static ThemeData theme = ThemeData(
    primaryColor: ProjectColors.blue,
    appBarTheme: appBarTheme,
    floatingActionButtonTheme: fabTheme,
    bottomNavigationBarTheme: bottomNavTheme,
  );
}
