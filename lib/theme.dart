import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/my_provider.dart';

ThemeData ligthTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.dark,
  primarySwatch: Colors.lightBlue,
  primaryColor: Color.fromARGB(255, 0, 25, 105),
  canvasColor: Color.fromARGB(255, 0, 12, 51),
  splashColor: const Color(0xFF4169e8),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStatePropertyAll(Colors.white),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    primarySwatch: Colors.orange,
    primaryColor: Colors.orange[300],
    splashColor: Colors.orange,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.white),
      ),
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      color: Colors.white,
    ));

ThemeMode myTheme(bool current) {
  return current ? ThemeMode.dark : ThemeMode.light;
}
