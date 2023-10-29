import 'package:flutter/material.dart';
import 'package:food_buddy/models/food_items.dart';
import 'package:food_buddy/widgets/add_ingredient.dart';
import 'package:food_buddy/widgets/custom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

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

  final List<FoodItems> vegetablesList = [
    FoodItems(
        product: 'Carrot',
        amount: 7,
        expirationDate: DateTime(
            DateTime.now().year, DateTime.now().month + 2, DateTime.now().day + 1),
        category: Category.vegetables),
    FoodItems(
        product: 'Beetroot',
        amount: 3,
        expirationDate: DateTime(
            DateTime.now().year, DateTime.now().month + 1, DateTime.now().day + 14),
        category: Category.vegetables),
    FoodItems(
      product: 'Onion',
      amount: 2,
      expirationDate: DateTime(
          DateTime.now().year, DateTime.now().month + 1, DateTime.now().day +13),
      category: Category.vegetables,
    ),
    FoodItems(
      product: 'Cabbage',
      amount: 1,
      expirationDate: DateTime(
          DateTime.now().year, DateTime.now().month + 1, DateTime.now().day + 7),
      category: Category.vegetables,
    ),
    FoodItems(
      product: 'Potato',
      amount: 3,
      expirationDate: DateTime(
          DateTime.now().year, DateTime.now().month + 3, DateTime.now().day + 21),
      category: Category.vegetables,
    ),
  ];

  final List<FoodItems> dairyList = [
    FoodItems(
        product: 'Milk',
        amount: 1,
        expirationDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day + 4),
        category: Category.dairy),
    FoodItems(
        product: 'Yogurt',
        amount: 10,
        expirationDate: DateTime(
            DateTime.now().year, DateTime.now().month + 1, DateTime.now().day + 2),
        category: Category.dairy),
  ];

  final List<FoodItems> meatList = [
    FoodItems(
        product: 'Chicken',
        amount: 3,
        expirationDate: DateTime(
            DateTime.now().year, DateTime.now().month + 2, DateTime.now().day + 21),
        category: Category.meats),
    FoodItems(
        product: 'Goat',
        amount: 2,
        expirationDate: DateTime(
            DateTime.now().year, DateTime.now().month , DateTime.now().day + 10),
        category: Category.meats),
    FoodItems(
        product: 'Beef',
        amount: 5,
        expirationDate: DateTime(
            DateTime.now().year, DateTime.now().month + 1, DateTime.now().day + 19),
        category: Category.meats),
    FoodItems(
        product: 'Lamb',
        amount: 3,
        expirationDate: DateTime(
            DateTime.now().year, DateTime.now().month , DateTime.now().day + 17),
        category: Category.meats),
  ];

  void _showModel() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: ((ctx) => const AddIngredient()),
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
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/inventory.jpg"),
              fit: BoxFit.cover,
            ),
          ),
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                height: MediaQuery.of(context).size.height / 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: fruitsList
                      .length, // Number of items in the horizontal list
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width:
                          MediaQuery.of(context).size.width / 3, // Card width
                      child: Card(
                        color: Color(0x80FF9800),
                        // elevation: 4.0,
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                fruitsList[index].product,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              
                              const Spacer(),
                              Text("Quantity", style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),),
                              Text(
                                fruitsList[index].amount.toString(),
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text("Expires by", style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),),
                              Text(formatter
                                  .format(fruitsList[index].expirationDate), style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),),
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                height: MediaQuery.of(context).size.height / 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: vegetablesList
                      .length, // Number of items in the horizontal list
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width:
                          MediaQuery.of(context).size.width / 3, // Card width
                      child: Card(
                        color: Color(0x80FF9800),
                        // elevation: 4.0,
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                vegetablesList[index].product,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              
                              const Spacer(),
                              Text("Quantity", style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),),
                              Text(
                                vegetablesList[index].amount.toString(),
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text("Expires by", style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),),
                              Text(formatter
                                  .format(vegetablesList[index].expirationDate), style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),


              //Dairy

              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Dairy',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                height: MediaQuery.of(context).size.height / 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dairyList
                      .length, // Number of items in the horizontal list
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width:
                          MediaQuery.of(context).size.width / 3, // Card width
                      child: Card(
                        color: Color(0x80FF9800),
                        // elevation: 4.0,
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                dairyList[index].product,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              
                              const Spacer(),
                              Text("Quantity", style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),),
                              Text(
                                dairyList[index].amount.toString(),
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text("Expires by", style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),),
                              Text(formatter
                                  .format(dairyList[index].expirationDate), style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),),
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
                      'Meat',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                height: MediaQuery.of(context).size.height / 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: meatList
                      .length, // Number of items in the horizontal list
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width:
                          MediaQuery.of(context).size.width / 3, // Card width
                      child: Card(
                        color: Color(0x80FF9800),
                        // elevation: 4.0,
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                meatList[index].product,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              
                              const Spacer(),
                              Text("Quantity", style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),),
                              Text(
                                meatList[index].amount.toString(),
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text("Expires by", style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),),
                              Text(formatter
                                  .format(meatList[index].expirationDate), style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
