import 'dart:convert';

import 'package:app/utils/fontFamily.dart';
import 'package:app/view_models/footer_view_model.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/ingredientsImages.dart';
import '../view_models/searchCardByName.dart';
import '../view_models/select_upload_image.dart';
import 'package:http/http.dart' as http;

import 'details.dart';



class SearchResultView extends StatefulWidget {
  List? output;
  IngredientsImages _IngredientsImages = IngredientsImages();
  SearchResultView({super.key, required this.output});

  @override
  State<SearchResultView> createState() => _SearchResultView();
}

class _SearchResultView extends State<SearchResultView> {
  List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var finalList = "";

    for (var item in widget.output!) {
      if(finalList == "") {
        if (widget._IngredientsImages.contains(item["detectedClass"])) {
        finalList += item["detectedClass"];}
      } else {
        if (widget._IngredientsImages.contains(item["detectedClass"])) {
        finalList += ',${item["detectedClass"]}';}
      }
    }

    final response = await http.get(Uri.parse('https://editables.online/?ingredients=${finalList}'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        products = data.cast<Map<String, dynamic>>();
      });
    } else {
      print('Failed to fetch JSON data.');
      print(widget.output);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text("Search result" , style: TextStyle(fontFamily: AppFontFamily.fontFamily,color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              //_FilterButton(),
              Column(
                children: products.map((product) {
                  String author = product["Author"];
                  String image = product["Image_Link"];
                  String name = product["Recipe_Name"];
                  String Prep_Time = product["Prep_Time"];
                  String rating =product["Rating"];
                  RegExp regex = RegExp(r'(\d+.\d+)');
                  Match? match = regex.firstMatch(rating);

                  if (match != null) {
                    rating = match.group(0)!;
                  }else{
                    rating="4.0";
                  }

                  int id = int.parse(product["id"]);
                  assert(id is int);

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                            id: id,
                            name: name,
                            image: image,
                          ),
                        ),
                      );
                    },
                    child: SearchCardByName(name,Prep_Time, image,rating),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(

          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const SelectUploadImage();
              },
            );
          },
          backgroundColor: AppColors.primaryColor,
          elevation: 0,

          child: Icon(Icons.camera_alt),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const FooterViewModel());
  }
}

class _FilterButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
        child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      "assets/icons/filter.svg",
                      width: 24.0,
                      height: 24.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: const FilterChipExample()
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    "Search results",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: AppColors.fontFamily,
                      fontWeight: FontWeight.w700
                    ),
                ),
              ),

            ]
          )
    );
  }
}
enum TimeFilter { All, Newest, Oldest, Popularity }
enum CategoryFilter { All, Cereal, Vegetables, Dinner, Chinese, Fruit, Breakfast, Spanish, Lunch}

class FilterChipExample extends StatefulWidget {
  const FilterChipExample({super.key});

  @override
  State<FilterChipExample> createState() => _FilterChipExampleState();
}

class _FilterChipExampleState extends State<FilterChipExample> {
  Set<TimeFilter> timeFilters = <TimeFilter>{};
  Set<CategoryFilter> categoryFilters = <CategoryFilter>{};

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Time', style: TextStyle(fontFamily: AppFontFamily.fontFamily),),
          const SizedBox(height: 5.0),
          Wrap(
            spacing: 5.0,
            children: TimeFilter.values.map((TimeFilter exercise) {
              return FilterChip(
                backgroundColor: Colors.white,
                selectedColor: AppColors.primaryColor,
                showCheckmark: false,
                side: const BorderSide(width: 1.0, color: AppColors.primaryColor),
                label: Text(exercise.name,style: TextStyle(fontFamily: AppFontFamily.fontFamily),),
                selected: timeFilters.contains(exercise),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      timeFilters.add(exercise);
                    } else {
                      timeFilters.remove(exercise);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 10.0),
          Text('Category',style: TextStyle(fontFamily: AppFontFamily.fontFamily),),
          const SizedBox(height: 5.0),
          Wrap(
            spacing: 5.0,
            children: CategoryFilter.values.map((CategoryFilter exercise) {
              return FilterChip(
                backgroundColor: Colors.white,
                selectedColor: AppColors.primaryColor,
                showCheckmark: false,
                side: const BorderSide(width: 1.0, color: AppColors.primaryColor),
                label: Text(exercise.name,style: TextStyle(fontFamily: AppFontFamily.fontFamily,color: AppColors.primaryColor),),
                selected: categoryFilters.contains(exercise),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      categoryFilters.add(exercise);
                    } else {
                      categoryFilters.remove(exercise);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 10.0),
          Text(
            'Delete me later: ${timeFilters.map((TimeFilter e) => e.name).join(', ')}, ${categoryFilters.map((CategoryFilter e) => e.name).join(', ')}',
              style: TextStyle(fontFamily: AppFontFamily.fontFamily),
          ),
          Container(
            width: 174,
            height: 37,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "week_menu/");
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
              ),
              child: const Text(
                "Filter",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontFamily: AppFontFamily.fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}