import 'package:app/services/foodData.dart';
import 'package:app/utils/fontFamily.dart';
import 'package:app/view_models/footer_view_model.dart';
import 'package:app/view_models/imageCardAuthor.dart';
import 'package:app/views/details.dart';
import 'package:app/views/searchResultByName.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/view_models/select_upload_image.dart';

import '../view_models/savedRecipeCard.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
            "Nutritio",
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
                          fontFamily: "Circular",
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
                      height: 210,
                      // This height is the remaining height minus the estimated heights of the above widgets.
                      child: TabBarView(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            height: 220.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                ImageCardAuthor(
                                    "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/sweet-potato-curry-46f4bc8.jpg?quality=90&webp=true&resize=300,272",
                                    "Vegan chickpea  ",
                                    "Anna Berry"),
                                ImageCardAuthor(
                                    "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/bubble-857a9ea.jpg?quality=90&webp=true&resize=300,272",
                                    "Poached eggs",
                                    "Jennifer Irvine"),
                                ImageCardAuthor(
                                    "https://images.immediate.co.uk/production/volatile/sites/30/2022/09/Pochierte-Eierpoached-eggsFruehstueckBrunchZubereitungMethodevegetarisch.-97fc78d.jpg?quality=90&webp=true&resize=300,272",
                                    "Poached eggs",
                                    "Anna Berry"),
                                // You can add more containers here
                              ],
                            ),
                          ),
                          Container(
                            height: 350, // Define the height as you want
                            child: Center(
                                child: Text('Settings Page',
                                    style: TextStyle(fontFamily: "Circular"))),
                          ),
                          Container(
                            height: 350, // Define the height as you want
                            child: Center(
                                child: Text('Profile Page',
                                    style: TextStyle(fontFamily: "Circular"))),
                          ),
                          Container(
                            height: 350, // Define the height as you want
                            child: Center(
                                child: Text('Profile Page',
                                    style: TextStyle(fontFamily: "Circular"))),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Turn your day into a sweet day",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Circular",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FoodData()
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
        child: SvgPicture.asset(
          'assets/icons/plus.svg',
          width: 24,
          height: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FooterViewModel(),
    );
  }
}
