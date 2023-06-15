import 'package:app/utils/fontFamily.dart';
import 'package:app/view_models/imageCardAuthor.dart';
import 'package:app/view_models/savedRecipeCard.dart';
import 'package:app/views/details.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import '../view_models/searchCardByName.dart';

class SearchResultByName  extends StatefulWidget{
  String name;
  @override
  State<SearchResultByName> createState() => _SearchResultByNameState();
  SearchResultByName({required this.name});
}

class _SearchResultByNameState extends State<SearchResultByName> {
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
    return( Scaffold(
      appBar: AppBar(title: Text(widget.name),centerTitle: true,elevation: 0,),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text("Search Result for",style: TextStyle(fontFamily: AppFontFamily.fontFamily),),
            ),
            Column(
              children: 
                  
              products.map((product) {
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
                  child: SearchCardByName(author, name,5, image),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    ));
  }
}