import 'package:flutter/material.dart';
import 'package:food_buddy/recipe_data.dart';
import 'package:food_buddy/widgets/custom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeCooking extends StatelessWidget {
  const RecipeCooking({super.key, required this.index});

  final int index;

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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/recipe.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Expanded(
          child: Card(
            color: const Color.fromARGB(178, 0, 0, 0),
            shadowColor: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${RecipeData().recipeList[index].recipeName}', style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.white, 
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                  ),),
                  Text('Ingredients: ${RecipeData().ingredients(index)}', style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white
                    )
                  ),),
                  Text(RecipeData().instructions(index), style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white
                    )
                  ),),
                  // Text(RecipeData().),
                  Text('Duration of the meal: ${RecipeData().recipeList[index].minutes.toString()}', style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white
                    )
                  ),),
                  Text('Ratings: ${RecipeData().recipeList[index].ratings.toString()}', style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white
                    )
                  ),),
                  Text('Calories ${RecipeData().recipeList[index].calories.toString()}', style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white
                    )
                  ),),
                  Text('Total fat content ${RecipeData().recipeList[index].totalFat.toString()}', style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white
                    )
                  ),),
                  Text('Sugar content ${RecipeData().recipeList[index].sugar.toString()}', style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white
                    )
                  ),),
                  Text('Sodium content ${RecipeData().recipeList[index].sodium.toString()}', style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white
                    )
                  ),),
                  Text('Protein content ${RecipeData().recipeList[index].protein.toString()}', style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white
                    )
                  ),),
                  Text('Saturated Fats ${RecipeData().recipeList[index].saturatedFats.toString()}', style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white
                    )
                  ),),
                  Text('Carbohydrates ${RecipeData().recipeList[index].carbohydrates.toString()}', style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white
                    )
                  ),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
