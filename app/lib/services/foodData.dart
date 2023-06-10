import 'package:http/http.dart';
import 'dart:convert';

class FoodData{
  String? location;
  String? recipeName;
  String? recipeImage;
  String? recipeAuthor;
  String? url;
  FoodData({this.url});

  Future<Map> getData() async {
    Response response = await get('$url' as Uri);
    Map data = jsonDecode(response.body);
   return data;
  }

  String? getRecipeName(){
    var decodedData  = getData();

  }
}
FoodData foodData =
FoodData(url: "https://www.bbcgoodfood.com/api/recipes-frontend/lists/card/recipe?id[]=5207");

