import 'package:app/view_models/homeCardModel.dart';
import 'package:app/view_models/searchCardByName.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../views/details.dart';
import 'imageCardAuthor.dart';
class HomeSuggestionSmall extends StatefulWidget{
  String? name;
  HomeSuggestionSmall(String name){
    this.name = name;
  }

  @override
  State<HomeSuggestionSmall> createState() => _HomeSuggestionSmallState();
}

class _HomeSuggestionSmallState extends State<HomeSuggestionSmall> {
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {

    final response = await http.get(Uri.parse('https://editables.online/?nameRandom=${widget.name}'));

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
      height: 500,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: products.map((product) {
          String author = product["Author"];
          String image = product["Image_Link"];
          String name = product["Recipe_Name"];
          if (name.length > 35) {
            name = name.substring(0, 35);
          }

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
            child: ImageCardAuthor(image, name, author),
          );
        }).toList(),
      ),
    );
  }

}