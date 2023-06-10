import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../view_models/savedRecipeCard.dart';

void main() {
  runApp(Test());
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shimmer Example'),
        ),
        body: Center(
          child: Text("hello"),
        ),
      ),
    );
  }
}
