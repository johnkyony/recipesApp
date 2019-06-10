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
      ),
      //Used for the recipes title:
      title: base.title.copyWith(
        fontFamily:  'Merriweather',
        fontSize: 15.0,
        color: const Color(0xFF807A6B),
      ),
      //used for the recipes duration
      caption: base.caption.copyWith(
        color: const Color(0xFFCCC5AF),
      )
    );
  }

  //We ant to override a default light blue theme
  final ThemeData base = ThemeData.light();

  //and apply changes on it:
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),

    //new theme colours 
    primaryColor:  const Color(0xFFFFF8E1),
    indicatorColor: const Color(0xFF807A6B),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    accentColor:  const Color(0xFFFFF8E1),
    iconTheme: IconThemeData(
      color: const Color(0xFFCCC5AF),
      size: 20.0
    ),
    buttonColor: Colors.white
  );
}