import 'package:flutter/material.dart';

class IngredientsImages {
  static final Map<String, String> _list = <String, String>{
  "broccoli": "https://img.rewe-static.de/1007433/21403678_digital-image.png?impolicy=s-products&imwidth=240&output-format=image/webp",
    "orange": "https://ekomarkt.de/media/image/product/30687/lg/orangen-im-netz-bio-1kg.jpg",
    "carrot":"https://img.rewe-static.de/1045111/21288882_digital-image.png?impolicy=s-products&imwidth=240&output-format=image/webp",
    "banana":"https://img.rewe-static.de/1028378/33873287_digital-image.png?impolicy=s-products&imwidth=240&output-format=image/webp",
    "apple":"https://img.rewe-static.de/0136053/24569357_digital-image.png?impolicy=s-products&imwidth=240&output-format=image/webp"
  };
  final map = Map.from(_list);

  getPicture(String value) {
    if(map.containsKey(value)) {
      return map[value];
    } else {
      return "https://static.vecteezy.com/system/resources/previews/007/451/786/non_2x/an-outline-isometric-icon-of-unknown-product-vector.jpg";
    }
  }
  contains(item) {
    if(map.containsKey(item)) {
      return true;
    } else {
      return false;
    }
  }
  static Map<String, String> get list => _list;


}