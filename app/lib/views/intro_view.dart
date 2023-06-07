import 'package:flutter/material.dart';
class IntroView extends StatefulWidget {
  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;

    DecorationImage backgroundImage = DecorationImage(
      image: NetworkImage('https://images.unsplash.com/photo-1543362906-acfc16c67564?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=765&q=80'),
      fit: BoxFit.cover,
    );

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return DefaultTextStyle(
          style: TextStyle(
            decoration: TextDecoration.none,
          ),
          child: Container(
            height: _deviceHeight,
            decoration: BoxDecoration(
              image: backgroundImage,
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
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: _deviceHeight * 0.1),
                  Text(
                    "Nutritio.",
                    style: TextStyle(
                      fontSize: 36,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    "300K+ Premium Recipe",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 150),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(1, 100, 1, 20),
                    child: Text(
                      "Get Cooking",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    "Simple way to find Tasty Recipe",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Poppins",
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 50),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "home/");
                    },
                    child: Text(
                      "Start cooking",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: "Poppins",

                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      padding: EdgeInsets.fromLTRB(70, 30, 70, 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


