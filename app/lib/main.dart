import 'package:app/views/details.dart';
import 'package:app/views/homeUpload_view.dart';
import 'package:app/views/home_view.dart';
import 'package:app/views/intro_view.dart';
import 'package:app/views/notification.dart';
import 'package:app/views/profile.dart';
import 'package:app/views/savedRecipe_view.dart';
import 'package:app/views/searchResult_view.dart';
import 'package:app/views/tensorflow_result_view.dart';
import 'package:app/views/test.dart';
import 'package:app/views/week_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {"/": (e) => HomeView(),
      "week_menu/": (e) => WeekMenu(),
      "home_upload/":(e)=>HomeUploadView(),
      "savedRecipe/":(e)=>SavedRecipeView(),
      "home/":(e)=>HomeView(),
      "notification/":(e)=>NotificationProject(),
      "profile/":(e)=>Profile()
    },
  ));
}
