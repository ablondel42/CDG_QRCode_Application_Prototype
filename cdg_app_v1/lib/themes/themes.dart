import 'package:flutter/material.dart';

/// This file contains the colors used throughout the application
/// It helps to avoid rewriting the colors all the time, by simply accessing
/// the Theme data of the widget context.

final textTheme = TextTheme(
  labelSmall: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  labelMedium: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  labelLarge: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  bodySmall: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  bodyMedium: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  bodyLarge: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  titleSmall: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  titleMedium: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  titleLarge: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  headlineSmall: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  headlineMedium: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  headlineLarge: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  displaySmall: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  displayMedium: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
  displayLarge: TextStyle(
    color: lightColorScheme.primary,
    fontFamily: 'Anantason',
  ),
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromARGB(255, 32, 76, 37),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color.fromARGB(255, 255, 255, 255),
  onPrimaryContainer: Color(0xFF002107),
  secondary: Color(0xFFbbe9f9),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color.fromARGB(255, 255, 255, 255),
  onSecondaryContainer: Color(0xFF002107),
  tertiary: Color(0xFF00677C),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xffbbf9e3),
  onTertiaryContainer: Color(0xFF001F27),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFF8FDFF),
  onBackground: Color(0xFF001F25),
  surface: Color(0xFFF8FDFF),
  onSurface: Color(0xFF001F25),
  surfaceVariant: Color(0xFFDEE5D9),
  onSurfaceVariant: Color(0xFF424940),
  outline: Color(0xFF72796F),
  onInverseSurface: Color(0xFFD6F6FF),
  inverseSurface: Color(0xFF00363F),
  inversePrimary: Color(0xFF8AD88F),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF1E6C30),
  outlineVariant: Color(0xFFC2C9BE),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF8AD88F),
  onPrimary: Color(0xFF003911),
  primaryContainer: Color(0xFF00531D),
  onPrimaryContainer: Color(0xFFA5F5A9),
  secondary: Color(0xFF6DDD7D),
  onSecondary: Color(0xFF003911),
  secondaryContainer: Color(0xFF00531D),
  onSecondaryContainer: Color(0xFF89FB96),
  tertiary: Color(0xFF58D5F7),
  onTertiary: Color(0xFF003642),
  tertiaryContainer: Color(0xFF004E5E),
  onTertiaryContainer: Color(0xFFB2EBFF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF001F25),
  onBackground: Color(0xFFA6EEFF),
  surface: Color(0xFF001F25),
  onSurface: Color(0xFFA6EEFF),
  surfaceVariant: Color(0xFF424940),
  onSurfaceVariant: Color(0xFFC2C9BE),
  outline: Color(0xFF8C9389),
  onInverseSurface: Color(0xFF001F25),
  inverseSurface: Color(0xFFA6EEFF),
  inversePrimary: Color(0xFF1E6C30),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF8AD88F),
  outlineVariant: Color(0xFF424940),
  scrim: Color(0xFF000000),
);
