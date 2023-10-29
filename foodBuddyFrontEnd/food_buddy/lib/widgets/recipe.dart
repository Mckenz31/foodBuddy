import 'package:flutter/material.dart';
import 'package:food_buddy/models/recipe_content.dart';
import 'package:food_buddy/recipe_data.dart';
import 'package:food_buddy/widgets/custom_drawer.dart';
import 'package:food_buddy/widgets/recipe_cooking.dart';
import 'package:google_fonts/google_fonts.dart';

class Recipe extends StatefulWidget {
  const Recipe({super.key});

  @override
  State<Recipe> createState() {
    return _Recipe();
  }
}

class _Recipe extends State<Recipe> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Buddy',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      drawer: const CustomDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/recipe.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: RecipeData().recipeList.length,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RecipeCooking(index: index,),
                  ),
                );
              },
              child: Card(
                color: const Color.fromARGB(142, 11, 11, 11),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(RecipeData().recipeList[index].recipeName, style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Colors.white, 
                          fontSize: 30
                        ),
                      ),),
                      const SizedBox(height: 10,),
                      Text(RecipeData().ingredients(index), style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          
                        ),
                      )),
                      Text('Time required: ${RecipeData().recipeList[index].minutes.toString()} minutes', style: const TextStyle(color: Colors.white)),
                      Text('Calories: ${RecipeData().recipeList[index].calories.toString()}', style: const TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
