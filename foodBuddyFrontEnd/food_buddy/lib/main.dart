import 'package:flutter/material.dart';
import 'package:food_buddy/models/recipe_content.dart';
import 'package:food_buddy/widgets/inventory.dart';
import 'package:food_buddy/widgets/login.dart';
import 'package:food_buddy/widgets/on_boarding.dart';
import 'package:food_buddy/widgets/recipe.dart';
import 'package:food_buddy/widgets/recipe_cooking.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const OnBoarding(),
    ),
  );
}

