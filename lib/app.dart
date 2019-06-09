import 'package:flutter/material.dart';

import 'package:recipes_app/ui/screens/login.dart';
import 'package:recipes_app/ui/screens/home.dart';
import 'package:recipes_app/ui/theme.dart';

class RecipesApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes',
      theme: buildTheme(),
      initialRoute: '/login',
      routes: {
        //if you're using navigation routes  flutter needs a base route
        //e're going to change this route once ere ready with 
        //implementation of home screen

        '/': (context) => HomeScreen(),
        '/login':(context) => LoginScreen(),

      },
    );
  }
}