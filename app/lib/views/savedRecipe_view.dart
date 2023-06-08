import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';
import '../view_models/footer_view_model.dart';
import '../view_models/savedRecipeCard.dart';
import '../view_models/weekMenuCard.dart';

class SavedRecipeView extends StatefulWidget {
  @override
  State<SavedRecipeView> createState() => _SavedRecipeViewState();
}

class _SavedRecipeViewState extends State<SavedRecipeView> {
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
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Saved Recipes",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Circular",
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                SavedRecipeCard("Monday","Creamy mushroom pasta",50,"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/creamy_mushroom_pasta-fc7ab67.jpg?quality=90&webp=true&resize=300,272"),
                SavedRecipeCard("Tuesday","Apricot Glazed Apple Tart",25,"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-197477_10-8d45e07.jpg?quality=90&webp=true&resize=300,272"),
                SavedRecipeCard("Thursday","Chicken & bacon pasta",25,"https://images.immediate.co.uk/production/volatile/sites/30/2021/02/Chicken-and-bacon-pasta-acac96f.jpg?quality=90&webp=true&resize=300,272"),
                //SavedRecipeCard("Wenesday","Spaghetti bolognese",25,"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/the-best-spaghetti-bolognese-7e83155.jpg?quality=90&webp=true&resize=300,272"),
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
