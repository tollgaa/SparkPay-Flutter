import 'package:flutter/material.dart';
import 'constants.dart';


final ThemeData lightTheme = ThemeData(
  primaryColor: ArkaPlanRengi,
  scaffoldBackgroundColor: ArkaPlanRengi,
  appBarTheme: const AppBarTheme(
    color: GunduzAppBarRengi,
    titleTextStyle: TextStyle(
      color: GunduzMetinRengi,
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: GunduzMetinRengi, fontFamily: fontFamily),
    bodyMedium: TextStyle(color: GunduzMetinRengi, fontFamily: fontFamily),
  ),
);


final ThemeData darkTheme = ThemeData(
  primaryColor: GeceArkaPlanRengi,
  scaffoldBackgroundColor: GeceArkaPlanRengi,
  appBarTheme: const AppBarTheme(
    color: GeceAppBarRengi,
    titleTextStyle: TextStyle(
      color: GeceMetinRengi,
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: GeceMetinRengi, fontFamily: fontFamily),
    bodyMedium: TextStyle(color: GeceMetinRengi, fontFamily: fontFamily),
  ),
);
