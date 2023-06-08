import 'package:app/view_models/footer_view_model.dart';
import 'package:app/view_models/imageCardAuthor.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter_svg/svg.dart';



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
        body: Container(

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
