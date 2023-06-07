import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1543362906-acfc16c67564?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=765&q=80'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
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
            ),
            Center(
              child:  Padding(
                padding: EdgeInsets.fromLTRB(20, 151, 20, 20),
                child: Column(

                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Center(
                        child: Text(
                          "Nutritio.",
                          style: TextStyle(
                              fontSize: 36,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          "300K+ Premium Recipe",
                          style: TextStyle(fontSize: 18, fontFamily: "Poppins",color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 200, 20, 10),
                        child: Container(
                          child: Center(

                            child: Text(
                              "Get Cooking",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",color: Colors.white),
                            ),
                          ),
                        )),
                    Container(
                      child: Center(
                        child: Text(
                          "Simple way to find Tasty Recipe",
                          style: TextStyle(fontSize: 18,fontFamily: "Poppins",color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Container(
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Start cooking",style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: "Poppins"),),
                          style: TextButton.styleFrom(backgroundColor: Colors.green[600],padding: EdgeInsets.fromLTRB(45, 25, 45, 25)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
