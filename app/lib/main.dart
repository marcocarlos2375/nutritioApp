import 'package:app/views/homeUpload_view.dart';
import 'package:app/views/home_view.dart';
import 'package:app/views/notification.dart';
import 'package:app/views/profile.dart';
import 'package:app/views/savedRecipe_view.dart';
import 'package:app/views/week_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {"/": (e) => Home(),
      "week_menu/": (e) => WeekMenu(),
      "home_upload/":(e)=>HomeUploadView(),
      "savedRecipe/":(e)=>SavedRecipeView(),
      "home/":(e)=>Home(),
      "notification/":(e)=>NotificationProject(),
      "profile/":(e)=>Profile()
    },
  ));
}
