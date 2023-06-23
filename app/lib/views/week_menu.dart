import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app/view_models/weekMenuCard.dart';
import 'package:http/http.dart' as http;

import '../utils/ingredientsImages.dart';

class WeekMenu extends StatefulWidget {
  List? output;
  IngredientsImages _IngredientsImages = IngredientsImages();
  WeekMenu({super.key,this.output});

  @override
  State<WeekMenu> createState() => _WeekMenuState();
}

class _WeekMenuState extends State<WeekMenu> {
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var finalList = "";

    for (var item in widget.output!) {
      if(finalList == "") {
        if(widget._IngredientsImages.contains(item["detectedClass"])){
          finalList += item["detectedClass"];
        }

      } else {
        if(widget._IngredientsImages.contains(item["detectedClass"])){
        finalList += ',${item["detectedClass"]}';
        }
      }
    }

    final response = await http.get(Uri.parse('https://editables.online/?week_menu_with_ingredients=${finalList}'));

    if (response.statusCode == 200) {
      print(finalList);
      print(finalList);
      print(finalList);
      print(finalList);
      print(finalList);
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        products = data.cast<Map<String, dynamic>>();
      });
    } else {
      print('Failed to fetch JSON data.');
      print(finalList);
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
          style: TextStyle(color: Colors.black, fontFamily: "Circular",fontSize: 18),
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
                  child: Text("Week menu",
                    style: TextStyle(
                      color: Colors.black, fontFamily: "Circular", fontSize: 22,fontWeight:FontWeight.w600,),textAlign: TextAlign.left,),
                ),
                //IconButton(onPressed: (){}, icon: Icons.accessibility_new_outlined),
              ],
            ),
            SizedBox(height: 10,),
            if(products.isNotEmpty)...[
              WeekMenuCard("Monday", products[0]["Recipe_Name"],products[0]["Prep_Time"],products[0]["Image_Link"]),
              WeekMenuCard("Tuesday",products[1]["Recipe_Name"],products[1]["Prep_Time"],products[1]["Image_Link"]),
              WeekMenuCard("Wednesday",products[2]["Recipe_Name"],products[2]["Prep_Time"],products[2]["Image_Link"]),
              WeekMenuCard("Thursday",products[3]["Recipe_Name"],products[3]["Prep_Time"],products[3]["Image_Link"]),
              WeekMenuCard("Friday",products[4]["Recipe_Name"],products[4]["Prep_Time"],products[4]["Image_Link"]),
              WeekMenuCard("Saturday",products[5]["Recipe_Name"],products[5]["Prep_Time"],products[5]["Image_Link"]),
              WeekMenuCard("Sunday",products[6]["Recipe_Name"],products[6]["Prep_Time"],products[6]["Image_Link"]),
            ]
          ],
        ),
      ),
    ));
  }
}
