import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../utils/fontFamily.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Details extends StatefulWidget {
  final int id;
  final String image;
  final String name;

  Details({required this.id, required this.image, required this.name});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late Recipe recipe; // Declare the Recipe object without initialization

  @override
  void initState() {
    super.initState();
    recipe = Recipe(); // Initialize the Recipe object here
    fetchData(); // Call the function to fetch data when the widget is initialized
  }

  void fetchData() async {
    String url = "https://editables.online/?id=${widget.id}";

    try {
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // If the request is successful
        Map<String, dynamic> data = json.decode(response.body);

        // Populate the Recipe object with data from the response
        recipe.id = data["id"];
        recipe.name = data["Recipe_Name"];
        recipe.description = data["Description"];
        recipe.imageLink = data["Image_Link"];
        recipe.ingredients = parseIngredients(data["Ingredients"]).cast<String>();
        recipe.instructions = parseInstructions(data["Instructions"]);
        recipe.prepTime = data["Prep_Time"];
        recipe.cookTime = data["Cook_Time"];
        recipe.difficulty = data["Difficulty"];
        recipe.servings = data["Servings"];
        recipe.author = data["Author"];
        recipe.rating = data["Rating"];
        recipe.ratingsCount = data["Ratings_Count"];
        //recipe.nutritionInfo = parseNutritionInfo(data["Nutrition_Info"]);
        recipe.url = data["url"];
        recipe.test = parseNutritionInfo(data["Nutrition_Info"]);

        setState(() {
          // Update the widget after fetching and parsing the data
        });
      } else {
        throw Exception("Failed to fetch data");
      }
    } catch (error) {
      print(error);
    }
  }

  String parseNutritionInfo(String nutritionString) {
  //nutritionString = nutritionString.replaceAll(":", "=");
  nutritionString = nutritionString.replaceAll("[", "{");
  nutritionString = nutritionString.replaceAll("]", "}");

  if(nutritionString=="{}"){
    nutritionString = "No_information_found";
  }
    return nutritionString;
  }


  List<String> parseIngredients(String ingredients) {
    List<String> ingredientList = ingredients.split(", ");
    List<String> parsedIngredients = [];

    for (String ingredientString in ingredientList) {
      List<String> ingredientData = ingredientString.split(" ");

      if (ingredientData.length >= 3) {
        String ingredient = ingredientString;
        parsedIngredients.add(ingredient);
      }
    }

    return parsedIngredients;
  }

  List<String> parseInstructions(String instructions) {
    return instructions.split(". ");
  }

  @override
  Widget build(BuildContext context) {
    String name = widget.name;
    String image = widget.image;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          name,
          style: TextStyle(
              color: Colors.black,
              fontFamily: AppFontFamily.fontFamily,
              fontSize: 18),
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
              image,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 250),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
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
          SizedBox(height: 50),

          Text(
            '${widget.name}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: AppFontFamily.fontFamily,
            ),
          ),
          Text(
            'Serves ${recipe.servings}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: AppFontFamily.fontFamily,
            ),
          ),
          Text(
            'Difficulty: ${recipe.difficulty}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: AppFontFamily.fontFamily,
            ),
          ),
          Text(
            'Preparation Time: ${recipe.prepTime}, Cooking Time: ${recipe.cookTime}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              fontFamily: AppFontFamily.fontFamily,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Ingredients:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: AppFontFamily.fontFamily,
            ),
          ),
          if (recipe.ingredients != null)
            for (var ingredient in recipe.ingredients!)
              ListTile(
                title: Text(
                 ingredient,
                  style: TextStyle(
                    fontFamily: AppFontFamily.fontFamily,
                    fontWeight: FontWeight.w400,
                  ),
                ),

              ),
          SizedBox(height: 10),
          Text(
            'Instructions:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: AppFontFamily.fontFamily,
            ),
          ),
          SizedBox(height: 10),
          if (recipe.instructions != null)
            for (var instruction in recipe.instructions!)
              ListTile(
                title: Text(
                  instruction,
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: AppFontFamily.fontFamily,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
          SizedBox(height: 10),
          Text(
            'Nutrition:',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: AppFontFamily.fontFamily,
            ),
          ),
          SizedBox(height: 10),
          Text("${recipe.test}")

        ],
      ),
    );
    return details;
  }
}
