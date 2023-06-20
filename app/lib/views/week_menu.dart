import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app/view_models/weekMenuCard.dart';
import 'package:http/http.dart' as http;

class WeekMenu extends StatefulWidget {
  List? output;
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
        finalList += item["detectedClass"];
      } else {
        finalList += ',${item["detectedClass"]}';
      }
    }

    final response = await http.get(Uri.parse('https://editables.online/?ingredients=${finalList}'));

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
          style: TextStyle(color: Colors.black, fontFamily: "Circular",fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
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
          WeekMenuCard("Monday","creamy mushroom pasta",50,"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/creamy_mushroom_pasta-fc7ab67.jpg?quality=90&webp=true&resize=300,272"),
          WeekMenuCard("Tuesday","Apricot Glazed Apple Tart",25,"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-197477_10-8d45e07.jpg?quality=90&webp=true&resize=300,272"),
          WeekMenuCard("Thursday","Chicken & bacon pasta",25,"https://images.immediate.co.uk/production/volatile/sites/30/2021/02/Chicken-and-bacon-pasta-acac96f.jpg?quality=90&webp=true&resize=300,272"),
          WeekMenuCard("Wenesday","Spaghetti bolognese",25,"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/the-best-spaghetti-bolognese-7e83155.jpg?quality=90&webp=true&resize=300,272"),
        ],
      ),
    ));
  }
}
