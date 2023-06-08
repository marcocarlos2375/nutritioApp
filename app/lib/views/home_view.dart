import 'package:app/view_models/footer_view_model.dart';
import 'package:app/view_models/imageCardAuthor.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter_svg/svg.dart';

import '../view_models/savedRecipeCard.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("home"),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
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
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                      "Our Selection this Week",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Circular",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.0),
                      height: 200.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SavedRecipeCard(
                                "Monday",
                                "Creamy mushroom pasta",
                                50,
                                "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-197477_10-8d45e07.jpg?quality=100&webp=true&resize=1350,772"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SavedRecipeCard(
                                "Monday",
                                "Creamy mushroom pasta",
                                30,
                                "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chicken_pasta_bake-06fe2d6.jpg?quality=90&webp=true&resize=1350,772"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SavedRecipeCard(
                                "Monday",
                                "Creamy mushroom pasta",
                                30,
                                "https://images.immediate.co.uk/production/volatile/sites/30/2021/02/Chicken-and-bacon-pasta-acac96f.jpg?quality=90&webp=true&resize=1350,772"),
                          ),

                          // You can add more containers here
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.20,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "week_menu/");
                            },
                            child: Text(
                              "Take pictures",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontFamily: "Circular",
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "week_menu/");
                            },
                            style: ButtonStyle(
                              side:
                                  MaterialStateProperty.resolveWith<BorderSide>(
                                (states) => BorderSide(
                                  color: Colors.green,
                                  width: 1.0,
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                EdgeInsets.fromLTRB(60, 20, 60, 20),
                              ),
                            ),
                            child: Text(
                              "Select Pictures",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 13,
                                fontFamily: "Circular",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          child: SvgPicture.asset(
            'icons/plus.svg',
            width: 24,
            height: 24,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: FooterViewModel());
  }
}
