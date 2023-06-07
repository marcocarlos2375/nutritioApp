import 'package:flutter/material.dart';

import '../view_models/weekMenuCard.dart';

class SavedRecipeView extends StatefulWidget {
  @override
  State<SavedRecipeView> createState() => _SavedRecipeViewState();
}

class _SavedRecipeViewState extends State<SavedRecipeView> {
  @override
  Widget build(BuildContext context) {

    double _deviceHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: _deviceHeight,
          child: Card(
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    child: Text("Saved Recipes"),
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Column(
                   children: [
                     WeekMenuCard("Monday","creamy mushroom pasta",50,"https://images.immediate.co.uk/production/volatile/sites/30/2020/08/creamy_mushroom_pasta-fc7ab67.jpg?quality=90&webp=true&resize=300,272"),

                   ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
