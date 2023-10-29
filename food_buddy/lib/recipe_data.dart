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
        minutes: 25,
        ratings: 4.6,
        calories: 151,
        totalFat: 34,
        sugar: 91.2,
        protein: 27.7,
        saturatedFats: 103.9,
        carbohydrates: 45.2),
    RecipeContent(
        recipeName: 'Frankie',
        ingredients: ['Tortia', 'Chicken', 'Tomato', 'Pickles', 'Onions'],
        instructions: [
          'brown ground beef in large pot',
          'add chopped onions to ground beef when almost brown and sautee until wilted',
          'add all other ingredients',
          'add kidney beans if you like beans in your chili',
          'cook in slow cooker on high for 2-3 hours or 6-8 hours on low',
          'serve with cold clean lettuce and shredded cheese'
        ],
        sodium: 5,
        minutes: 75,
        ratings: 4.2,
        calories: 240,
        totalFat: 3.2,
        sugar: 77.2,
        protein: 18.4,
        saturatedFats: 97.9,
        carbohydrates: 56.2),
    RecipeContent(
        recipeName: 'Brelllalan',
        ingredients: [
          'Bun',
          'Corn',
          'Fish',
          'Beans',
          'Onions',
          'Avacadoes',
          'Pineapple',
          'Tortia'
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
        calories: 305,
        totalFat: 34,
        sugar: 91.2,
        protein: 27.7,
        saturatedFats: 103.9,
        carbohydrates: 45.2),
    RecipeContent(
        recipeName: 'bananas 4 ice cream  pie',
        ingredients: [
          'chocolate syrup',
          'vanilla ice cream',
          'bananas',
          'strawberry ice cream',
          'whipped cream'
        ],
        instructions: [
          'crumble cookies into a 9-inch pie plate , or cake pan',
          'pat down to form an even layer',
          'drizzle 1 cup of chocolate topping evenly over the cookies with a small spoon',
          'scoop the vanilla ice cream on top of the chocolate and smooth down',
          'cover with half of the sliced bananas',
          'top with strawberry ice cream',
          'cover and freeze until firm',
          'before serving , top with 1 / 4 cup chocolate topping , whipped cream , and sliced bananas'
        ],
        sodium: 15,
        minutes: 26,
        ratings: 3.3,
        calories: 145,
        totalFat: 99.8,
        sugar: 71,
        protein: 27.1,
        saturatedFats: 34.9,
        carbohydrates: 51),
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
    String instruction = "STEPS => 1: ";
    for (int i = 0;
        i < RecipeData().recipeList[index].instructions.length;
        i++) {
      if (i == 0) {
        instruction =
            instruction + RecipeData().recipeList[index].instructions[i];
      } else {
        instruction =
            '$instruction. ${i + 2}: ${RecipeData().recipeList[index].instructions[i]}';
      }
    }
    return instruction;
  }
}
