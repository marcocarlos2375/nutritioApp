import 'package:app/view_models/footer_view_model.dart';
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
    return
      Scaffold(
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
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "What are you cooking today?",
                    style: TextStyle(
                        fontSize: 11,
                        fontFamily: "Poppins",
                        color: Colors.grey),
                  ),
                ],
              )
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
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: null,

                            child: Text(
                              "select pictures",
                              style: TextStyle(fontFamily: "Poppins"),
                            )),
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
        bottomNavigationBar: FooterViewModel()
      );
  }
}