import 'package:app/view_models/footer_view_model.dart';
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
          padding: const EdgeInsets.fromLTRB(40, 5, 20, 5),
          child: Column(
            children: [
              Column(
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
                  SizedBox(height: 10,),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text(
                    "Recommandation",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Circular",
                        fontWeight: FontWeight.w600,
                        color: Colors.black,

                    ),
                  ),
                  SizedBox(height: 10,),
                  SavedRecipeCard("Monday","creamy mushroom pasta",50,"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-197477_10-8d45e07.jpg?quality=100&webp=true&resize=350,272"),

                ],
              ),

            ],
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
