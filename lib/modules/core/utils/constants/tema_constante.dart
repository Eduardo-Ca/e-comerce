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

//================= ESCURO ========================
final ThemeData temaEscuro = ThemeData(
 appBarTheme: const AppBarTheme(
    color: Colors.deepOrange,
  ),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.grey[700]),
   canvasColor: Colors.grey[700],
  cardTheme: const CardTheme(
    color: Colors.white,
  ),
  iconTheme: const IconThemeData(color: Colors.deepOrange),
  primarySwatch: Colors.deepOrange,
  brightness: Brightness.light,
  primaryColor: Colors.deepOrange,
  primaryColorLight: Colors.deepOrange,
);

