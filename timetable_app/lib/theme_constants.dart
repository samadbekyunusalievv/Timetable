import 'package:flutter/material.dart';
ThemeData ManasTheme=ThemeData(
  indicatorColor: Colors.black,
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  textTheme:  const TextTheme(
    titleMedium: TextStyle(
      color: Colors.grey,fontSize: 20,
    ),


    displayMedium: TextStyle(
      color: Colors.black,fontSize: 18,
    ),
  ),
);
ThemeData GradientTheme=ThemeData(
  indicatorColor: Colors.deepPurple[500],
  brightness: Brightness.dark,
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
  textTheme:  const TextTheme(
    titleMedium: TextStyle(
      color: Colors.grey,fontSize: 20,
    ),
    displayMedium: TextStyle(
      color: Colors.white,fontSize: 18,
    ),
  ),
);
