import 'package:app/views/details.dart';
import 'package:app/views/homeUpload_view.dart';
import 'package:app/views/home_view.dart';
import 'package:app/views/intro_view.dart';
import 'package:app/views/savedRecipe_view.dart';
import 'package:app/views/searchResult_view.dart';
import 'package:app/views/week_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {"/": (e) => IntroView(),
      "week_menu/": (e) => WeekMenu(),
      "home_upload/":(e)=>HomeUploadView(),
      "savedRecipe/":(e)=>SavedRecipeView(),
      "details/":(e)=>Details(),
      "home/":(e)=>HomeView(),
      "searchResult/":(e)=>SearchResultView(null)
    },
  ));
}
