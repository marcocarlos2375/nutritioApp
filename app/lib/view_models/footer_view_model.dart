import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';

class FooterViewModel extends StatelessWidget {
  get floatingActionButton => null;

  @override
  Widget build(BuildContext context) {
    return ( BottomAppBar(
      //bottom navigation bar on scaffold
      color: Colors.white,
      elevation: 1,
      //shape: AppColors.starColor,
      //shape of notch
      notchMargin: 6,
      height: 85,
      shadowColor: Colors.grey[50],
      //notche margin between floating button and bottom appbar
      child: Row(
        //children inside bottom appbar
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              icon: SvgPicture.asset(
                'icons/home-2.svg',
                width: 24,
                height: 24,
                color: AppColors.primaryColor,
                colorBlendMode: BlendMode.srcIn,
                // Remove the color property
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              } //do something,
          ),
          IconButton(
            icon:
            SvgPicture.asset('icons/Union.svg', width: 24, height: 24),
            onPressed: () {
              Navigator.pushNamed(context, "savedRecipe/");
            },
          ),
          IconButton(
            icon: SvgPicture.asset('icons/notification.svg',
                width: 24, height: 24),
            onPressed: () {
              Navigator.pushNamed(context, "notification/");
            },
          ),
          IconButton(
            icon: SvgPicture.asset('icons/profile.svg',
                width: 24, height: 24),
            onPressed: () {},
          ),
        ],
      ),
    ));
  }
}
