import 'package:app/utils/colors.dart';
import 'package:flutter/material.dart';
class ResultRecipeCard extends StatelessWidget{
  String? day;
  String? recipe;
  int? preparation_time;
  String? imagePath;

  ResultRecipeCard(
      String day, String recipe, int preparation_time, String imagePath) {
    this.day = day;
    this.recipe = recipe;
    this.preparation_time = preparation_time;
    this.imagePath = imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      '$imagePath'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(20),
                //margin: EdgeInsets.all(10),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$recipe',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Circular',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'can be cooked in $preparation_time min',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Circular',
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 20,)
      ],
    ));
  }
}