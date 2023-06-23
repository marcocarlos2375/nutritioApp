import 'package:app/models/ingredient.dart';

class Recipe {
  String? name;
  String? image;
  List<String>? ingredients;
  List<String>? instructions;
  String? preparationTime;
  String? cookingTime;
  String? servingSize;
  String? difficulty;
  String? description;
  String? test;
  Map<String, String>? nutrition;

  Recipe(
      {this.name,
      this.image,
      this.ingredients,
      this.instructions,
      this.preparationTime,
      this.cookingTime,
      this.servingSize,
      this.difficulty,
      this.description,
      this.nutrition,
      this.test});

  get prepTime => null;

  get cookTime => null;

  get servings => null;

  get nutritionInfo => null;

  set url(url) {}

  set nutritionInfo(nutritionInfo) {}

  set ratingsCount(ratingsCount) {}

  set rating(rating) {}

  set author(author) {}

  set servings(servings) {}

  set cookTime(cookTime) {}

  set prepTime(prepTime) {}

  set imageLink(imageLink) {}

  set id(id) {}
}
