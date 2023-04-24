import 'package:flutter/material.dart';

final ThemeData temaClaro = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.orange,
  ),
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),

  cardTheme: const CardTheme(
    color: Colors.white,
  ),
  iconTheme: const IconThemeData(color: Colors.orange),
  primarySwatch: Colors.orange,
  brightness: Brightness.light,
  primaryColor: Colors.orange,
  primaryColorLight: Colors.orange,
);

//!================= ESCURO ========================
final ThemeData temaEscuro = ThemeData(
  bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color.fromARGB(255, 59, 59, 59)),
  canvasColor: const Color.fromARGB(255, 4, 32, 74),
  cardTheme: const CardTheme(
    color: Color.fromARGB(255, 8, 43, 95),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  primarySwatch: Colors.blueGrey,
  brightness: Brightness.dark,
  primaryColor: const Color.fromARGB(31, 62, 62, 62),
  primaryColorLight: const Color(0xffffcdd2),
);
