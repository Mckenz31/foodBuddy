import 'package:food_buddy/models/recipe_content.dart';

class RecipeData {
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
        sodium: 5,
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
        sodium: 7,
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
        sodium: 5,
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
        ingredients: [
          'Bun',
          'Evil Unicorn',
          'Fish',
          'Cabbage',
          'Onions',
          'Avacadoes',
          'Pineapple'
        ],
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
        sodium: 7,
        minutes: 40,
        ratings: 4.6,
        calories: 153,
        totalFat: 34,
        sugar: 91.2,
        protein: 27.7,
        saturatedFats: 103.9,
        carbohydrates: 45.2),
  ];

  String ingredients(index) {
    String ingredient = "";
    for (int i = 0;
        i < RecipeData().recipeList[index].ingredients.length;
        i++) {
      if (i == 0) {
        ingredient = ingredient + RecipeData().recipeList[index].ingredients[i];
      } else {
        ingredient =
            ingredient + ", " + RecipeData().recipeList[index].ingredients[i];
      }
    }
    return ingredient;
  }

  String instructions(index) {
    String instruction= "STEPS => 1: ";
    for (int i = 0;
        i < RecipeData().recipeList[index].instructions.length;
        i++) {
      if (i == 0) {
        instruction = instruction + RecipeData().recipeList[index].instructions[i];
      } else {
        instruction =
            '$instruction. ${i+2}: ${RecipeData().recipeList[index].instructions[i]}';
      }
    }
    return instruction;
  }
}
