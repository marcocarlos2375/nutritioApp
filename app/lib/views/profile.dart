import 'package:flutter/material.dart';

import '../utils/fontFamily.dart';
import '../view_models/footer_view_model.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontFamily: AppFontFamily.fontFamily,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey.shade100,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1543353071-087092ec393a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=150&q=100'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Carlos",
                    style: TextStyle(
                      fontFamily: AppFontFamily.fontFamily,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Cooking Enthusiast",
                    style: TextStyle(
                      fontFamily: AppFontFamily.fontFamily,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Bio:",
                    style: TextStyle(
                      fontFamily: AppFontFamily.fontFamily,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "I love cooking and experimenting with new recipes. Follow me for some delicious food ideas!",
                    style: TextStyle(
                      fontFamily: AppFontFamily.fontFamily,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Followers: 10k",
                    style: TextStyle(
                      fontFamily: AppFontFamily.fontFamily,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Following: 500",
                    style: TextStyle(
                      fontFamily: AppFontFamily.fontFamily,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterViewModel(),
    );
  }
}
