import 'package:app/view_models/homeCardModel.dart';
import 'package:app/view_models/searchCardByName.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../views/details.dart';
class HomeSuggestion extends StatefulWidget{
  @override
  State<HomeSuggestion> createState() => _HomeSuggestionState();
}

class _HomeSuggestionState extends State<HomeSuggestion> {
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {

    final response = await http.get(Uri.parse('https://editables.online/?week_menu_with_ingredients=egg'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        products = data.cast<Map<String, dynamic>>();
      });
    } else {
      print('Failed to fetch JSON data.');

    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: products.map((product) {
          String author = product["Author"];
          String image = product["Image_Link"];
          String name = product["Recipe_Name"];
          String prepTime = product["Prep_Time"];
          String rating = product["Rating"];
          RegExp regex = RegExp(r'(\d+.\d+)');
          Match? match = regex.firstMatch(rating);

          if (match != null) {
            rating = match.group(0)!;
          } else {
            rating = "4.0";
          }

          int id = int.parse(product["id"]);
          assert(id is int);

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(
                    id: id,
                    name: name,
                    image: image,
                  ),
                ),
              );
            },
            child: HomeCardModel(name, prepTime, image, rating),
          );
        }).toList(),
      ),
    );
  }

}