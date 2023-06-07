import 'package:app/models/ingredient.dart';

class Recipe {
  String name;
  String image;
  List<Ingredient> ingredients;
  List<String> instructions;
  Duration preparationTime;
  Duration cookingTime;
  int servingSize;
  String difficulty;
  String description;
  Map<String, String> nutrition;

  Recipe({
    required this.name,
    required this.image,
    required this.ingredients,
    required this.instructions,
    required this.preparationTime,
    required this.cookingTime,
    required this.servingSize,
    required this.difficulty,
    required this.description,
    required this.nutrition
  });

  @override
  String toString() {
    var result = 'Recipe: $name\nIngredients:\n';
    for (var ingredient in ingredients) {
      result += '- ${ingredient.toString()}\n';
    }
    return result;
  }

  void addIngredient(Ingredient ingredient) {
    ingredients.add(ingredient);
  }

  void removeIngredient(Ingredient ingredient) {
    ingredients.remove(ingredient);
  }
}
