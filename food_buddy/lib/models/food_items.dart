import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category {fruits, vegetables, snacks, meats, spices, dairy, grains, others}

// const categoryItem = {
//   Category.fruits: Icon(FontAwesomeIcons.appleWhole),
//   Category.vegetables: Icon(FontAwesomeIcons.vegetables)
// };

class FoodItems{

  FoodItems({required this.product, required this.amount, required this.purchaseDate, required this.expirationDate, required this.category}): id = uuid.v4();

  final String id;
  final String product;
  final double amount;
  final DateTime purchaseDate;
  final DateTime expirationDate;
  final Category category;

  String get formattedPurchaseDate{
    return formatter.format(purchaseDate);
  }

  String get formattedExpiryDate{
    return formatter.format(purchaseDate);
  }

  DateTime get currentDate{
    return DateTime.now();
  }
}