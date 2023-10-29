class RecipeContent {
  RecipeContent(
      {required this.recipeName,
      required this.ingredients,
      required this.instructions,
      required this.hours,
      required this.minutes,
      required this.ratings,
      required this.calories,
      required this.totalFat,
      required this.sugar,
      required this.protein,
      required this.saturatedFats,
      required this.carbohydrates});

  final String recipeName;
  final List ingredients;
  final List instructions;
  final int hours;
  final int minutes;
  final double ratings;
  final double calories;
  final double totalFat;
  final double sugar;
  final double protein;
  final double saturatedFats;
  final double carbohydrates;
}
