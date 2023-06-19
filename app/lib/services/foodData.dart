import 'dart:html';

import 'package:app/view_models/imageCardAuthor.dart';
import 'package:app/views/details.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class FoodData extends StatefulWidget {
  @override
  State<FoodData> createState() => _FoodDataState();
}


class _FoodDataState extends State<FoodData> {
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  fetchProducts() async {
    // Charger le fichier JSON à partir des assets
    String jsonData = await DefaultAssetBundle.of(context).loadString(
        'assets/json/data.json');
    List<dynamic> data = json.decode(jsonData);

    setState(() {
      products = data.cast<Map<String, dynamic>>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products.map((product) {
        String author = product["Author"];
        String image = product["Image Link"];
        String name = product["Recipe Name"];
        int id = product["url"];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Details(
                  id: id,
                  name:name,
                  image:image
                ),
              ),
            );
          },
          child: ImageCardAuthor(image, name, author),
        );
      }).toList(),
    );
  }
}
