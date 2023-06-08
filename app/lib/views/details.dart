import 'package:flutter/material.dart';

import '../models/ingredient.dart';
import '../models/recipe.dart';

class Details extends StatefulWidget {
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var recipe = Recipe(
    name: 'Spaghetti puttanesca',
    image:
        'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/puttanesca-cfb4e42.jpg?quality=90&webp=true&resize=300,272',
    ingredients: [
      Ingredient(name: 'olive oil', quantity: 3, unit: 'tbsp'),
      Ingredient(name: 'onion, finely chopped', quantity: 1, unit: 'pcs'),
      Ingredient(
          name: 'large garlic cloves, crushed', quantity: 2, unit: 'pcs'),
      Ingredient(name: 'chilli flakes', quantity: 0.5, unit: 'tsp'),
      Ingredient(name: 'chopped tomatoes', quantity: 400, unit: 'g'),
      Ingredient(
          name: 'anchovy fillets, finely chopped', quantity: 5, unit: 'pcs'),
      Ingredient(name: 'pitted black olives', quantity: 120, unit: 'g'),
      Ingredient(name: 'capers, drained', quantity: 2, unit: 'tbsp'),
      Ingredient(name: 'dried spaghetti', quantity: 300, unit: 'g'),
      Ingredient(name: 'parsley, finely chopped', quantity: 0.5, unit: 'bunch'),
    ],
    instructions: [
      'Heat the oil in a non-stick pan over a medium-low heat. Add the onion along with a generous pinch of salt and fry for 10 mins, or until soft. Add the garlic and chilli, if using, and cook for a further minute..',
      'Stir the tomatoes, anchovies, olives and capers into the onion, bring to a gentle simmer and cook, uncovered, for 15 mins. Season to taste.',
      'Meanwhile, bring a large pan of salted water to the boil. Cook the spaghetti following pack instructions, then drain and toss with the sauce and parsley.'
    ],
    preparationTime: Duration(minutes: 10),
    cookingTime: Duration(minutes: 30),
    servingSize: 4,
    difficulty: 'Medium',
    description:
        'Cook up this classic sauce in one pan, then toss with spaghetti for a simple midweek meal. It s budget-friendly too, making it a great meal for the family',
    nutrition: {
      'kcal': '495',
      'fat': '19g',
      'saturates': '3g',
      'carbs': '66g',
      'sugars': '8g',
      'fibre': '6g',
      'protein': '13g',
      'salt': '1.8g',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Details",
          style: TextStyle(color: Colors.black, fontFamily: "Circular",fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(recipe.image),
              SizedBox(height: 10),
              Text(' ${recipe.description}',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,fontFamily: "Circular")),
              SizedBox(height: 10),
              Text('Ingredients:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal,fontFamily: "Circular")),
              for (var ingredient in recipe.ingredients)
                Text('- ${ingredient.toString()}',
                    style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Instructions:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,fontFamily: "Circular")),
              for (var instruction in recipe.instructions)
                Text('- $instruction', style: TextStyle(fontSize: 16,fontFamily: "Circular",fontWeight: FontWeight.normal)),
              SizedBox(height: 10),
              Text('Nutrition:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              for (var entry in recipe.nutrition.entries)
                Text('- ${entry.key}: ${entry.value}',
                    style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text(
                  'Preparation Time: ${recipe.preparationTime.inMinutes} minutes',
                  style: TextStyle(fontSize: 18)),
              Text('Cooking Time: ${recipe.cookingTime.inMinutes} minutes',
                  style: TextStyle(fontSize: 18)),
              Text('Serving Size: ${recipe.servingSize}',
                  style: TextStyle(fontSize: 18)),
              Text('Difficulty: ${recipe.difficulty}',
                  style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
