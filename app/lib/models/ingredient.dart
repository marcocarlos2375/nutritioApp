import 'package:flutter/material.dart';
class Ingredient {
  String name;
  double quantity;
  String unit;

  Ingredient({required this.name, required this.quantity, required this.unit});

  @override
  String toString() {
    return '$quantity $unit of $name';
  }
}
