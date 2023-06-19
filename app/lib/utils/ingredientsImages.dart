import 'package:flutter/material.dart';

class IngredientsImages {
  static final Map<String, String> _list = <String, String>{
    "tomato": "https://media.istockphoto.com/id/1398317661/photo/ripe-cherry-tomatoes-isolated-on-white-background-macro-shot-popular-worldwide-product-as.webp?b=1&s=170667a&w=0&k=20&c=qYFN6nXKdojDgDtnWycndhtuSYthoS7Skq_W3nOPJxA=",
    "ananas": "https://media.istockphoto.com/id/1432543823/photo/beautiful-ripe-pineapple.webp?b=1&s=170667a&w=0&k=20&c=XPe5GTvnBcd-O9rQU0ebcbiFi2gTRT7zhwrsxiV6l2s=",
    "orange": "https://media.istockphoto.com/id/1218867181/de/foto/mandarine-oder-clementine-mit-gr%C3%BCnen-bl%C3%A4ttern-isoliert-auf-wei%C3%9F.webp?s=2048x2048&w=is&k=20&c=TAFORg4Ii8ns0iDF4xqxwJANB40gBFEPBexTPgy4FlU="
  };
  final map = Map.from(_list);

  getPicture(String value) {
    if(map.containsKey(value)) {
      return map[value];
    } else {
      return "https://static.vecteezy.com/system/resources/previews/007/451/786/non_2x/an-outline-isometric-icon-of-unknown-product-vector.jpg";
    }
  }
}