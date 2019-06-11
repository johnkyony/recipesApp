import 'package:flutter/material.dart';
import 'package:recipes_app/app.dart';
import 'package:recipes_app/state_widget.dart';

// void main() => runApp(
//   new RecipesApp(),
// );

void main() => runApp(new StateWidget(
  child:  new RecipesApp(),
));