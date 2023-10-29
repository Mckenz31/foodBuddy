import 'package:flutter/material.dart';
import 'package:food_buddy/models/food_items.dart';
import 'package:food_buddy/widgets/add_fruits.dart';
import 'package:food_buddy/widgets/custom_drawer.dart';

class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() {
    return _Inventory();
  }
}

class _Inventory extends State<Inventory> {
  final image =
      'https://images.unsplash.com/photo-1682686581362-796145f0e123?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHx8';

  final List<FoodItems> fruitsList = [
    FoodItems(
        product: 'Apple',
        amount: 3,
        expirationDate: DateTime(
            DateTime.now().year, DateTime.now().month + 1, DateTime.now().day),
        category: Category.fruits),
    FoodItems(
        product: 'Mango',
        amount: 2,
        expirationDate: DateTime(
            DateTime.now().year, DateTime.now().month + 1, DateTime.now().day),
        category: Category.fruits),
    FoodItems(
      product: 'Banana',
      amount: 5,
      expirationDate: DateTime(
          DateTime.now().year, DateTime.now().month + 1, DateTime.now().day),
      category: Category.fruits,
    ),
  ];

  void _showModel() {
    showModalBottomSheet(
      context: context,
      builder: ((ctx) => const AddFruits()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Buddy'),
        backgroundColor: Colors.orange,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Fruits
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Fruits',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      _showModel();
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    fruitsList.length, // Number of items in the horizontal list
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 3, // Card width
                    child: Card(
                      elevation: 4.0,
                      margin: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              fruitsList[index].product,
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Container(
                            //   width: 150,
                            //   height: 100,
                            //   decoration: const BoxDecoration(
                            //     color: Colors.pink,
                            //     image: DecorationImage(
                            //       image: AssetImage("assets/banana1.jpg"),
                            //       fit: BoxFit
                            //           .cover, // You can use BoxFit.fitWidth, BoxFit.contain, etc. as per your requirement
                            //     ),
                            //   ),
                            // ),

                            const SizedBox(height: 8.0),
                            Text(fruitsList[index].amount.toString()),
                            const SizedBox(height: 4.0),
                            Text(formatter
                                .format(fruitsList[index].expirationDate)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Vegetables',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add))
              ],
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

            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Snacks',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add))
              ],
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
