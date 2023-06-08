import 'package:flutter/material.dart';

class ImageCardAuthor extends StatelessWidget {
  String? image;
  String? name;
  String? author;

  ImageCardAuthor(String image, String name, String author) {
    this.image = image;
    this.name = name;
    this.author = author;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      child: Column(
        children: [
          Image(image: NetworkImage("$image"),height: 120,),
          SizedBox(height: 10,),
          Text(
            "$name",
            style: TextStyle(
                fontSize: 15,
                fontFamily: "Circular",
                color: Colors.black),
          ),
          SizedBox(height: 5,),
          Text(
            "$author",
            style: TextStyle(
                fontSize: 11,
                fontFamily: "Circular",
                color: Colors.grey),
          ),
        ],
      ),
    );
  }
}