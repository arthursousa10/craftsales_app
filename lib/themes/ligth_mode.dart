import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Color.fromARGB(255, 7, 0, 38),
    primary: Color.fromARGB(255, 0, 80, 255),
    secondary: Color.fromARGB(255, 0, 3, 11),
    inversePrimary: Color.fromARGB(255, 255, 254, 254),
    surface: Color.fromARGB(255, 255, 255, 255)
  )
);


ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: Color.fromARGB(255, 7, 0, 38), 
    primary: Color.fromARGB(255, 0, 80, 255), 
    secondary: Color.fromARGB(255, 255, 255, 255), 
    inversePrimary: Color.fromARGB(255, 248, 247, 247),
    surface: Color.fromARGB(255, 10, 10, 10)
  )
);