import 'package:flutter/material.dart';
import 'package:food_buddy/widgets/inventory.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const Inventory(),
    ),
  );
}

