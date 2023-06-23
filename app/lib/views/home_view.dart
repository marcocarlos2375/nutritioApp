import 'package:app/views/searchResultByName.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/fontFamily.dart';
import '../view_models/footer_view_model.dart';
import '../view_models/homeSuggestion.dart';
import '../view_models/homeSuggestionSmall.dart';
import '../view_models/select_upload_image.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Nutritio0.",
            style: TextStyle(
              fontFamily: AppColors.fontFamily,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 5, 20, 5),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return DefaultTabController(
                length: 4, // Number of tabs
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Hello Carlos,",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Circular",
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "What are you cooking today?",
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: "Circular",
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: myController,
                      onChanged: (text) {
                        // Mettez votre logique de recherche ici
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        hintText: 'Search a Recipe...',
                        hintStyle: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontFamily: AppFontFamily.fontFamily,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SearchResultByName(
                                    name:myController.text
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Recommandation",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: AppFontFamily.fontFamily,
                          color: Colors.black),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        // BorderRadius for the tab indicator
                        color: AppColors.primaryColor,
                        // Color for the active tab
                      ),
                      labelStyle: TextStyle(
                        fontFamily: "Circular",
                      ),
                      tabs: <Widget>[
                        Container(
                          height: 30,
                          child: Tab(
                            child: Text(
                              "All",
                              style: TextStyle(
                                height:
                                1.75, // This is for line-height, it's a multiplier, not pixel value
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          child: Tab(
                            text: "BreakFst",
                          ),
                        ),
                        Container(
                          height: 35,
                          child: Tab(
                            text: "Dinner",
                          ),
                        ),
                        Container(
                          height: 35,
                          child: Tab(
                            text: "Diet",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 250,
                      // This height is the remaining height minus the estimated heights of the above widgets.
                      child: TabBarView(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            height: 220.0,
                            child: HomeSuggestionSmall("egg"),
                          ),
                          Container(
                            height: 250, // Define the height as you want
                            child: Center(
                                child: HomeSuggestionSmall("breakfast")),
                          ),
                          Container(
                            height: 250, // Define the height as you want
                            child: Center(
                                child: HomeSuggestionSmall("chicken")),
                          ),
                          Container(
                            height: 250, // Define the height as you want
                            child: Center(
                                child: HomeSuggestionSmall("vegan")),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Our Selection this week",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Circular",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20,),
                    Column(

                      children: [
                      HomeSuggestion()
                    ],),

                    SizedBox(
                      height: 45,
                    ),
                    Text(
                      "Drinks Sweet Day",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Circular",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20,),
                    Column(children: [
                      HomeSuggestionSmall("cocktail")
                    ],),

                  ],
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const SelectUploadImage();
            },
          );
        },
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        child:Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FooterViewModel(),
    );
  }
}