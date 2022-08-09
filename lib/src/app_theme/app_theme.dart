import 'package:flutter/material.dart';

import './material_color_generator/material_color_generator.dart';

/* **********************
 * Color palette
 * ********************** */

class _Colors {
  ///Private color palette for the light and dark theme
  static final MaterialColor _backgroundSwatch =
      MaterialColorGenerator.generateMaterialColor(Color(0xff46586a));
  static final MaterialColor _primarySwatch =
      MaterialColorGenerator.generateMaterialColor(Color(0xFF467A84));
  //dark color palette
  static final Color _darkBackground = _backgroundSwatch.shade800;
  static final Color _darkBackgroundVariant = _backgroundSwatch.shade900;
  static final Color _darkPrimary = _primarySwatch.shade500;
  static final Color _darkPrimaryVariant = _primarySwatch.shade400;

  static final Color _darkSecondary = _primarySwatch.shade400;
  static final Color _darkSecondaryVariant = _primarySwatch.shade400;
  static final Color _darkContrast =
      MaterialColorGenerator.tintColor(_backgroundSwatch.shade50, 0.3);
  static final Color _darkPrimaryContrast = _darkContrast;
  static final Color _darkError = Color(0xfff24343);
  //light color palette
  static final Color _lightBackground =
      MaterialColorGenerator.tintColor(_backgroundSwatch.shade50, 0.9);
  static final Color _lightBackgroundVariant =
      MaterialColorGenerator.tintColor(_backgroundSwatch.shade50, 0.7);
  static final Color _lightPrimary = _primarySwatch.shade500;
  static final Color _lightPrimaryVariant = _primarySwatch.shade600;
  static final Color _lightSecondary = _primarySwatch.shade600;
  static final Color _lightSecondaryVariant = _primarySwatch.shade600;
  static final Color _lightContrast = _backgroundSwatch.shade800;
  static final Color _lightPrimaryContrast = _lightBackground;
  static final Color _lightError = Color(0xfff24343);

  ///getters for the different colors
  MaterialColor backgroundSwatch() => _backgroundSwatch;
  Color background(bool isDarkTheme) =>
      isDarkTheme ? _darkBackground : _lightBackground;
  Color backgroundVariant(bool isDarkTheme) =>
      isDarkTheme ? _darkBackgroundVariant : _lightBackgroundVariant;
  Color primary(bool isDarkTheme) => isDarkTheme ? _darkPrimary : _lightPrimary;
  Color primaryVariant(bool isDarkTheme) =>
      isDarkTheme ? _darkPrimaryVariant : _lightPrimaryVariant;
  Color secondary(bool isDarkTheme) =>
      isDarkTheme ? _darkSecondary : _lightSecondary;
  Color secondaryVariant(bool isDarkTheme) =>
      isDarkTheme ? _darkSecondaryVariant : _lightSecondaryVariant;
  Color contrast(bool isDarkTheme) =>
      isDarkTheme ? _darkContrast : _lightContrast;
  Color primaryContrast(bool isDarkTheme) =>
      isDarkTheme ? _darkPrimaryContrast : _lightPrimaryContrast;
  Color error(bool isDarkTheme) => isDarkTheme ? _darkError : _lightError;
}

/* **********************
 * App Theme
 * ********************** */
class AppTheme {
  final _Colors colors = _Colors();

  TextStyle _generalTextStyle(bool isDarkTheme) => TextStyle(
        color: colors.contrast(isDarkTheme),
      );

  TextTheme _generalTextTheme(bool isDarkTheme) => TextTheme(
        headline1: TextStyle(),
        headline2: TextStyle(),
        headline3: TextStyle(),
        headline4: TextStyle(),
        headline5: TextStyle(),
        headline6: TextStyle(),
        subtitle1: TextStyle(),
        subtitle2: TextStyle(),
        caption: TextStyle(),
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
        button: TextStyle(),
      ).apply(
        bodyColor: colors.contrast(isDarkTheme),
        displayColor: colors.contrast(isDarkTheme),
      );

  ThemeData getTheme({required bool isDarkTheme}) {
    final brightness = isDarkTheme ? Brightness.dark : Brightness.light;

    const int elevatedBackgroundAlpha = 0x1f; // 12%
    const int elevatedIconAlpha = 0xde; // 87%
    const int elevatedSelectAlpha = 0x3d; // 12% + 12% = 24%
    const int disabledAlpha = 0x0c; // 38% * 12% = 5%
    const int notSelectedAlpha = 0x4D; // 30%

    return ThemeData(
      colorScheme: ColorScheme(
        //light or dark theme
        brightness: brightness,
        background: colors.background(isDarkTheme),
        surface: colors.background(isDarkTheme),
        primary: colors.primary(isDarkTheme),
        primaryVariant: colors.primaryVariant(isDarkTheme),
        secondary: colors.secondary(isDarkTheme),
        secondaryVariant: colors.secondaryVariant(isDarkTheme),
        onSurface: colors.contrast(isDarkTheme),
        onBackground: colors.background(isDarkTheme),
        error: colors.error(isDarkTheme),
        onPrimary: colors.primaryContrast(isDarkTheme),
        onSecondary: colors.background(isDarkTheme),
        onError: colors.background(isDarkTheme),
      ),

      //general color theme
      primarySwatch: MaterialColorGenerator.generateMaterialColor(
          colors.primary(isDarkTheme)),
      primaryColor: colors.primary(isDarkTheme),
      primaryColorDark: colors.primary(isDarkTheme),
      primaryColorLight: colors.primary(isDarkTheme),
      toggleableActiveColor: colors.secondary(isDarkTheme),
      //app background
      canvasColor: colors.background(isDarkTheme),
      //AppBar theme

      appBarTheme: AppBarTheme(
        color: colors.backgroundVariant(isDarkTheme),
        toolbarTextStyle: _generalTextStyle(isDarkTheme),
        titleTextStyle: _generalTextStyle(isDarkTheme),
        foregroundColor: colors.contrast(isDarkTheme),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: colors.contrast(isDarkTheme),
        enableFeedback: true,
        selectedItemColor: colors.primaryVariant(isDarkTheme),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: colors.background(isDarkTheme),
        elevation: 10,
        enableFeedback: true,
      ),
      //general text theme
      textTheme: _generalTextTheme(isDarkTheme),
      primaryTextTheme: _generalTextTheme(isDarkTheme),

      //affects Icon and IconButton
      iconTheme: IconThemeData(
        color: colors.contrast(isDarkTheme),
      ),
      //affects Icon and IconButton in AppBar and BottomBar
      primaryIconTheme: IconThemeData(
        color: colors.contrast(isDarkTheme),
      ),
      //checkboxes
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.selected)
                ? colors.secondary(isDarkTheme)
                : colors.secondary(isDarkTheme).withAlpha(notSelectedAlpha)),
        checkColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.selected)
                ? colors.primaryContrast(isDarkTheme)
                : colors.contrast(isDarkTheme).withAlpha(notSelectedAlpha)),
      ),
      //Radio Buttons
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.selected)
                ? colors.secondary(isDarkTheme)
                : colors.secondary(isDarkTheme).withAlpha(notSelectedAlpha)),
      ),
      //Chip widgets
      chipTheme: ChipThemeData(
        backgroundColor:
            colors.contrast(isDarkTheme).withAlpha(elevatedBackgroundAlpha),
        deleteIconColor:
            colors.contrast(isDarkTheme).withAlpha(elevatedIconAlpha),
        disabledColor: colors.contrast(isDarkTheme).withAlpha(disabledAlpha),
        selectedColor:
            colors.contrast(isDarkTheme).withAlpha(elevatedSelectAlpha),
        secondarySelectedColor:
            colors.secondary(isDarkTheme).withAlpha(elevatedSelectAlpha),
        padding: EdgeInsets.all(4.0),
        labelStyle: TextStyle(
          color:
              colors.contrast(isDarkTheme).withAlpha(elevatedIconAlpha), // 87%
        ),
        secondaryLabelStyle: TextStyle(
          color:
              colors.secondary(isDarkTheme).withAlpha(elevatedIconAlpha), // 87%
        ),
        brightness: brightness,
      ),
      //Input Boxes
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: colors.contrast(isDarkTheme).withAlpha(notSelectedAlpha),
        ),
      ),
      //Cards
      cardColor: colors.backgroundVariant(isDarkTheme),
      //Dialogs
      dialogTheme: DialogTheme(
        backgroundColor: colors.background(isDarkTheme),
      ),
    );
  }
}
