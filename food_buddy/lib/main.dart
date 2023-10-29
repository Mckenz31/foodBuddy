import 'package:flutter/material.dart';
import 'package:food_buddy/widgets/inventory.dart';
import 'package:food_buddy/widgets/recipe.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const Recipe(
        
      ),
    ),
  );
}

