import 'package:flutter/material.dart';

import '../utils/colors.dart';

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
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 150,
        height: 225,
        child: Column(
          textDirection: TextDirection.ltr,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: NetworkImage(
                        '$image'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$name",
                  style: TextStyle(
                      fontSize: 15, fontFamily: AppColors.fontFamily, color: Colors.black),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "By $author",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 11, fontFamily: AppColors.fontFamily, color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
