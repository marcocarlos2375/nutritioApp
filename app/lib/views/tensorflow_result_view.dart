import 'package:app/utils/fontFamily.dart';
import 'package:app/utils/ingredientsImages.dart';
import 'package:app/view_models/ingredientDetectedBox.dart';
import 'package:app/views/searchResult_view.dart';
import 'package:app/views/week_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';
import '../view_models/footer_view_model.dart';
import '../view_models/select_upload_image.dart';

class TensorflowResult extends StatefulWidget {
  const TensorflowResult({super.key});

  @override
  State<TensorflowResult> createState() => _TensorflowResult();
}

class _TensorflowResult extends State<TensorflowResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text("Search result"),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25,right: 25),
          child: _FilterButton(),
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
        bottomNavigationBar: const FooterViewModel());
  }
}

class _FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select the Next Step",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppColors.fontFamily,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SearchResultView(),
                          ),
                        );
                      },
                      child: Text("Show recipe",
                          style: TextStyle(color: Colors.white,fontFamily: AppFontFamily.fontFamily))),
                ),
                SizedBox(width: 30),
                Container(
                    width: 150,
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WeekMenu(),
                            ),
                          );
                        },
                        child: Text("Show week menu",
                            style: TextStyle(color: Colors.white,fontFamily: AppFontFamily.fontFamily))))
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Ingredients detected",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: AppColors.fontFamily,
                  fontWeight: FontWeight.w600,),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  IngredientDetectedBox(IngredientsImages.tomato, "Tomatoes"),
                  IngredientDetectedBox(IngredientsImages.ananas, "Ananas")
                 ],
              ),
            ),
          ],
        ));
  }
}


