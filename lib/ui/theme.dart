import 'package:flutter/material.dart';

ThemeData buildTheme(){
  //we're going to define all of our font styles 
  //in this method:

  TextTheme _buildTextTheme(TextTheme base){
    return base.copyWith(
      headline:  base.headline.copyWith(
        fontFamily: 'Merriweather',
        fontSize: 40.0, 
        color: const Color(0xFF807a6b),
      )
    );
  }

  //We ant to override a default light blue theme
  final ThemeData base = ThemeData.light();

  //and apply changes on it:
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme)
  );
}