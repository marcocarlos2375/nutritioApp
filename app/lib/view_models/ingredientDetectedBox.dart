import 'package:flutter/material.dart';

import '../utils/fontFamily.dart';

class IngredientDetectedBox extends StatelessWidget {
  String? ingredientName;
  String? ingredientImagePath;

  IngredientDetectedBox(String ingredientImagePath, String ingredientName) {
    this.ingredientImagePath = ingredientImagePath;
    this.ingredientName = ingredientName;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
          decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8)),

          ),
          padding: const EdgeInsets.all(12.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child:  Image(
                      height: 62,
                      width: 62,
                      image: NetworkImage('$ingredientImagePath'),
                    )),
                 SizedBox(width: 15),
                 Text(
                  '$ingredientName',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: AppFontFamily.fontFamily,
                      fontWeight: FontWeight.w600),
                ),
              ])),
    );
  }
}
