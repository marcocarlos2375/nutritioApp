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
    return (Scaffold(
      appBar: AppBar(
        title: Text("home"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 20,),
                Text(
                  "Hello Carlos,",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "What are you cooking today?",
                  style: TextStyle(
                      fontSize: 11, fontFamily: "Poppins", color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        onPressed: () {
          //code to execute on button press
        },
        child: SvgPicture.asset(
          'icons/plus.svg',
          // Adjust the path to match the actual location of your SVG file
          width: 24,
          height: 24,
          color: Colors.white,
        ), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FooterViewModel(),
    ));
  }
}
