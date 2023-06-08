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
            Center(
              child: Row(
                children: [Text("Home page ")],
              ),
            ),
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
      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        color: Colors.white,
        elevation: 1,
        shape: CircularNotchedRectangle(),
        //shape of notch
        notchMargin: 6,
        height: 70,
        shadowColor: Colors.grey[50],
        //notche margin between floating button and bottom appbar
        child: Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                icon: SvgPicture.asset(
                    'icons/homeIcon.svg',
                    width: 24,
                    height: 24
                ),
                onPressed: null //do something,
                ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.print,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon:SvgPicture.asset(
                  'icons/profile.svg',
                  width: 24,
                  height: 24
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    ));
  }
}
