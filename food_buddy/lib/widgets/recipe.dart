import 'package:flutter/material.dart';
import 'package:food_buddy/models/recipe_content.dart';
import 'package:food_buddy/widgets/custom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class Recipe extends StatefulWidget {
  const Recipe({super.key});

  @override
  State<Recipe> createState() {
    return _Recipe();
  }
}

class _Recipe extends State<Recipe> {

  List<RecipeContent> recipeList = [
    RecipeContent(
        recipeName: 'Hamburger',
        ingredients: ['Bun', 'Beef', 'Tomato', 'Cabbage', 'Onions'],
        instructions: [
          'Heat the bun',
          'Dance around the fireplace',
          'Flip the bun',
          'Dance again',
          'Heat the meat for 15mins',
          'Put all the ingredients together',
          'Dance and eat'
        ],
        hours: 5,
        minutes: 20,
        ratings: 4.2,
        calories: 173,
        totalFat: 3.2,
        sugar: 77.2,
        protein: 18.4,
        saturatedFats: 97.9,
        carbohydrates: 56.2),
    RecipeContent(
        recipeName: 'Jammy nan',
        ingredients: ['Bun', 'Chicken', 'Ramen', 'Cabbage', 'Onions'],
        instructions: [
          'make a choice and proceed with recipe',
          'depending on size of squash , cut into half or fourths',
          'remove seeds',
          'for spicy squash , drizzle olive oil or melted butter over each cut squash piece',
          'season with mexican seasoning mix ii',
          'for sweet squash , drizzle melted honey , butter , grated piloncillo over each cut squash piece',
          'season with sweet mexican spice mix',
          'bake at 350 degrees , again depending on size , for 40 minutes up to an hour , until a fork can easily pierce the skin',
          'be careful not to burn the squash especially if you opt to use sugar or butter',
          'if you feel more comfortable , cover the squash with aluminum foil the first half hour , give or take , of baking',
          'if desired , season with salt'
        ],
        hours: 7,
        minutes: 40,
        ratings: 4.6,
        calories: 153,
        totalFat: 34,
        sugar: 91.2,
        protein: 27.7,
        saturatedFats: 103.9,
        carbohydrates: 45.2),
    RecipeContent(
        recipeName: 'Frankie',
        ingredients: ['Bun', 'Donkey', 'Tomato', 'Cabbage', 'Onions'],
        instructions: [
          'brown ground beef in large pot',
          'add chopped onions to ground beef when almost brown and sautee until wilted',
          'add all other ingredients',
          'add kidney beans if you like beans in your chili',
          'cook in slow cooker on high for 2-3 hours or 6-8 hours on low',
          'serve with cold clean lettuce and shredded cheese'
        ],
        hours: 5,
        minutes: 20,
        ratings: 4.2,
        calories: 173,
        totalFat: 3.2,
        sugar: 77.2,
        protein: 18.4,
        saturatedFats: 97.9,
        carbohydrates: 56.2),
    RecipeContent(
        recipeName: 'Brelllalan',
        ingredients: ['Bun', 'Evil Unicorn', 'Fish', 'Cabbage', 'Onions', 'Avacadoes', 'Pineapple'],
        instructions: [
          'make a choice and proceed with recipe',
          'depending on size of squash , cut into half or fourths',
          'remove seeds',
          'for spicy squash , drizzle olive oil or melted butter over each cut squash piece',
          'season with mexican seasoning mix ii',
          'for sweet squash , drizzle melted honey , butter , grated piloncillo over each cut squash piece',
          'season with sweet mexican spice mix',
          'bake at 350 degrees , again depending on size , for 40 minutes up to an hour , until a fork can easily pierce the skin',
          'be careful not to burn the squash especially if you opt to use sugar or butter',
          'if you feel more comfortable , cover the squash with aluminum foil the first half hour , give or take , of baking',
          'if desired , season with salt'
        ],
        hours: 7,
        minutes: 40,
        ratings: 4.6,
        calories: 153,
        totalFat: 34,
        sugar: 91.2,
        protein: 27.7,
        saturatedFats: 103.9,
        carbohydrates: 45.2),
  ];

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
          itemCount: recipeList.length,
          itemBuilder: (ctx, index) {
            String ingredient = "";
            for(int i = 0; i < recipeList[index].ingredients.length; i++){
              if(i == 0){
                ingredient = ingredient + recipeList[index].ingredients[i];
              }
              else{
                ingredient = ingredient + ", " + recipeList[index].ingredients[i];
              }
            }
            return Card(
              color: const Color.fromARGB(129, 11, 11, 11),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(recipeList[index].recipeName, style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        color: Colors.white, 
                        fontSize: 30
                      ),
                    ),),
                    const SizedBox(height: 10,),
                    Text(ingredient, style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        
                      ),
                    )),
                    Text('Time required: ${recipeList[index].minutes.toString()} minutes', style: const TextStyle(color: Colors.white)),
                    Text('Calories: ${recipeList[index].calories.toString()}', style: const TextStyle(color: Colors.white))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
