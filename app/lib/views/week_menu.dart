import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app/view_models/weekMenuCard.dart';
import 'package:http/http.dart' as http;

import '../utils/ingredientsImages.dart';
import 'details.dart';

class WeekMenu extends StatefulWidget {
  List? output;
  IngredientsImages _IngredientsImages = IngredientsImages();

  WeekMenu({super.key, this.output});

  @override
  State<WeekMenu> createState() => _WeekMenuState();
}

class _WeekMenuState extends State<WeekMenu> {
  List<Map<String, dynamic>> products = [];
  List<String> days= ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var finalList = "";

    for (var item in widget.output!) {
      if (finalList == "") {
        if (widget._IngredientsImages.contains(item["detectedClass"])) {
          finalList += item["detectedClass"];
        }
      } else {
        if (widget._IngredientsImages.contains(item["detectedClass"])) {
          finalList += ',${item["detectedClass"]}';
        }
      }
    }

    final response = await http.get(Uri.parse(
        'https://editables.online/?week_menu_with_ingredients=${finalList}'));

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
    return (Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Week Menu suggestion",
          style: TextStyle(
              color: Colors.black, fontFamily: "Circular", fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                  child: Text(
                    "Week menu",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Circular",
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                //IconButton(onPressed: (){}, icon: Icons.accessibility_new_outlined),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            if (products.isNotEmpty) ...[
              for (int i = 0; i < products.length; i++)...
                [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Details(
                              id: int.parse(products[i]["id"]),
                              name: products[i]["Recipe_Name"],
                              image: products[i]["Image_Link"],
                            ),
                          ),
                        );
                      },
                      child: WeekMenuCard(days[i], products[i]["Recipe_Name"],
                          products[i]["Prep_Time"], products[i]["Image_Link"]))
                ]
            ]
          ],
        ),
      ),
    ));
  }
}
