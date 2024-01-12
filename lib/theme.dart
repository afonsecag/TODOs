import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFF6F35A5);
final Color accentColor = Color(0xFFf8edeb);
final TextStyle taskTitleStyle = TextStyle(color: Colors.white, fontSize: 18);
final TextStyle categoryTitleStyle = TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold);
const Color taskColor = Color(0xFFF3E5F5); 


final ThemeData appThemeData = ThemeData(
  primaryColor: primaryColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  ),

);