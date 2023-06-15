import 'package:flutter/material.dart';

import '../utils/fontFamily.dart';
import '../view_models/footer_view_model.dart';

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return(Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(color: Colors.black,fontFamily: AppFontFamily.fontFamily),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          child: Text("Profile" , style: TextStyle(fontFamily: AppFontFamily.fontFamily,fontSize: 26,color: Colors.black),),
        ),
      ),
      bottomNavigationBar: FooterViewModel(),
    ));

  }
}