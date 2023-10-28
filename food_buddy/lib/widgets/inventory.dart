import 'package:flutter/material.dart';
import 'package:food_buddy/models/food_items.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() {
    return _Inventory();
  }
}

class _Inventory extends State<Inventory> {
  final List<FoodItems> fruitsList = [
    FoodItems(
      product: 'Apple',
      amount: 3,
      purchaseDate: DateTime.now(),
      expirationDate: DateTime(
        DateTime.now().year, DateTime.now().month + 1, DateTime.now().day),
      category: Category.fruits
    ),
    FoodItems(
      product: 'Mango',
      amount: 3,
      purchaseDate: DateTime.now(),
      expirationDate: DateTime(
        DateTime.now().year, DateTime.now().month + 1, DateTime.now().day),
      category: Category.fruits
    ),
    FoodItems(
      product: 'Banana',
      amount: 3,
      purchaseDate: DateTime.now(),
      expirationDate: DateTime(
        DateTime.now().year, DateTime.now().month + 1, DateTime.now().day),
      category: Category.fruits
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Buddy'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            //Fruits
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Scrollable Horizontal Cards',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Number of items in the horizontal list
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 3, // Card width
                    child: Card(
                      child: Center(
                        child: Text('Card ${index + 1}'),
                      ),
                    ),
                  );
                },
              ),
            ),
      
      
      
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Scrollable Horizontal Cards',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Number of items in the horizontal list
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 3, // Card width
                    child: Card(
                      child: Center(
                        child: Text('Card ${index + 1}'),
                      ),
                    ),
                  );
                },
              ),
            ),
      
      
      
      
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Scrollable Horizontal Cards',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Number of items in the horizontal list
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 3, // Card width
                    child: Card(
                      child: Center(
                        child: Text('Card ${index + 1}'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
