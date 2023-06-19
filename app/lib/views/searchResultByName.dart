import 'dart:convert';
import 'package:app/utils/fontFamily.dart';
import 'package:app/view_models/searchCardByName.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../view_models/imageCardAuthor.dart';
import 'details.dart';

class SearchResultByName extends StatefulWidget {
  final String name;

  SearchResultByName({required this.name});

  @override
  _SearchResultByNameState createState() => _SearchResultByNameState();
}

class _SearchResultByNameState extends State<SearchResultByName> {
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    final response = await http.get(Uri.parse("https://editables.online/?name=${widget.name}"));

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Results for ${widget.name}",style: TextStyle(color: Colors.black,fontFamily: AppFontFamily.fontFamily),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:38.0),
          child: Column(
            children: products.map((product) {
              String author = product["Author"];
              String image = product["Image_Link"];
              String name = product["Recipe_Name"];
              String Prep_Time = product["Prep_Time"];
              String rating =product["Rating"];



              RegExp regex = RegExp(r'(\d+\.\d+)');
              Match? match = regex.firstMatch(rating);

              if (match != null) {
                 rating = match.group(0)!;
              }else{
                rating="4.0";
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
                child: SearchCardByName(name,Prep_Time, image,rating),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
