import 'package:flutter/material.dart';

class HomeUploadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Search with an Image",
          style: TextStyle(
              color: Colors.black, fontFamily: "Poppins", fontSize: 18),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 320,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "week_menu/");
                },
                child: Text(
                  "Take pictures",
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
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "week_menu/");
                },
                style: ButtonStyle(
                  side: MaterialStateProperty.resolveWith<BorderSide>(
                    (states) => BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    EdgeInsets.fromLTRB(70, 30, 70, 30),
                  ),
                ),
                child: Text(
                  "Select pictures",
                  style: TextStyle(
                    color: Colors.green[200],
                    fontSize: 16,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
