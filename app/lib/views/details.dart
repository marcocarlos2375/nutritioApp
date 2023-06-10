import 'package:flutter/material.dart';
import '../models/ingredient.dart';
import '../models/recipe.dart';
import '../utils/fontFamily.dart';

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
      Ingredient(name: 'Olive oil', quantity: 3, unit: 'tbsp'),
      Ingredient(name: 'Onion, finely chopped', quantity: 1, unit: 'pcs'),
      Ingredient(
          name: 'Large garlic cloves, crushed', quantity: 2, unit: 'pcs'),
      Ingredient(name: 'Chilli flakes', quantity: 0.5, unit: 'tsp'),
      Ingredient(name: 'Chopped tomatoes', quantity: 400, unit: 'g'),
      Ingredient(
          name: 'Anchovy fillets, finely chopped', quantity: 5, unit: 'pcs'),
      Ingredient(name: 'Pitted black olives', quantity: 120, unit: 'g'),
      Ingredient(name: 'Capers, drained', quantity: 2, unit: 'tbsp'),
      Ingredient(name: 'Dried spaghetti', quantity: 300, unit: 'g'),
      Ingredient(name: 'Parsley, finely chopped', quantity: 0.5, unit: 'bunch'),
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
      'Kcal': '495',
      'Fat': '19g',
      'Saturates': '3g',
      'Carbs': '66g',
      'Sugars': '8g',
      'Fibre': '6g',
      'Protein': '13g',
      'Salt': '1.8g',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          "Details",
          style: TextStyle(
              color: Colors.black, fontFamily: AppFontFamily.fontFamily, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.network(
              recipe.image,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 60),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                padding: const EdgeInsets.all(15.0),
                children: buildRecipeDetails(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildRecipeDetails() {
    List<Widget> details = [];
    details.add(
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          Text('${recipe.name}',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFontFamily.fontFamily)),
          Text('Serves ${recipe.servingSize}',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: AppFontFamily.fontFamily)),
          Text('Difficulty: ${recipe.difficulty}',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: AppFontFamily.fontFamily)),
          Text(
              'Preparation Time: ${recipe.preparationTime.inMinutes} minutes, Cooking Time: ${recipe.cookingTime.inMinutes} minutes',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  fontFamily: AppFontFamily.fontFamily)),
          SizedBox(height: 10),
          Text('Ingredients:',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFontFamily.fontFamily)),
          for (var ingredient in recipe.ingredients)
            ListTile(
              title: Text(ingredient.name,style: TextStyle(fontFamily: AppFontFamily.fontFamily,fontWeight: FontWeight.w400),),
              trailing: Text('${ingredient.quantity} ${ingredient.unit}',style: TextStyle(fontFamily: AppFontFamily.fontFamily),),
            ),
          SizedBox(height: 10),
          Text('Instructions:',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFontFamily.fontFamily)),
          SizedBox(height: 10,),
          for (var instruction in recipe.instructions)
            ListTile(
              title: Text(instruction,
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: AppFontFamily.fontFamily,
                      fontWeight: FontWeight.w300)),
            ),
          SizedBox(height: 10),
          Text('Nutrition:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,fontFamily: AppFontFamily.fontFamily)),
          SizedBox(height: 10,),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 2,
            children: recipe.nutrition.entries
                .map((entry) => Card(
              elevation: 0,
                      color: Colors.grey.shade100,
                      child: ListTile(
                        title: Text(entry.key,style: TextStyle(fontFamily: AppFontFamily.fontFamily),),
                        trailing: Text(entry.value,style: TextStyle(fontFamily: AppFontFamily.fontFamily,fontWeight: FontWeight.w300),),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
    return details;
  }
}
