import 'dart:io';

import 'package:app/utils/fontFamily.dart';
import 'package:app/view_models/footer_view_model.dart';
import 'package:app/view_models/imageCardAuthor.dart';
import 'package:app/view_models/resultRecipeCard.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../view_models/select_upload_image.dart';



class SearchResultView extends StatefulWidget {
  final File? image;

  const SearchResultView(this.image);

  @override
  State<SearchResultView> createState() => _SearchResultView();
}

class _SearchResultView extends State<SearchResultView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Text("Search result"),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: _FilterButton(widget.image),
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
          child: SvgPicture.asset(
            'assets/icons/plus.svg',
            width: 24,
            height: 24,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const FooterViewModel());
  }
}

class _FilterButton extends StatelessWidget {
  File? image;
  _FilterButton(this.image);

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
                    icon: const Icon(
                      Icons.tune,
                      size: 24.0,
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
              image != null ? Image.file(image!) : const Text("Not found!"),
              SizedBox(
                height: MediaQuery.of(context).size.height - 85,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: [
                      ResultRecipeCard(
                          "Monday",
                          "Vegan chickpea",
                          10,
                          "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/sweet-potato-curry-46f4bc8.jpg?quality=90&webp=true&resize=300,272"
                      ),
                      ResultRecipeCard(
                          "Monday",
                          "Vegan chickpea",
                          10,
                          "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/sweet-potato-curry-46f4bc8.jpg?quality=90&webp=true&resize=300,272"
                      ),
                      ResultRecipeCard(
                          "Monday",
                          "Vegan chickpea",
                          10,
                          "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/sweet-potato-curry-46f4bc8.jpg?quality=90&webp=true&resize=300,272"
                      ),
                      ResultRecipeCard(
                          "Monday",
                          "Vegan chickpea",
                          10,
                          "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/sweet-potato-curry-46f4bc8.jpg?quality=90&webp=true&resize=300,272"
                      ),
                      ResultRecipeCard(
                          "Monday",
                          "Vegan chickpea",
                          10,
                          "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/sweet-potato-curry-46f4bc8.jpg?quality=90&webp=true&resize=300,272"
                      ),
                      ResultRecipeCard(
                          "Monday",
                          "Vegan chickpea",
                          10,
                          "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/sweet-potato-curry-46f4bc8.jpg?quality=90&webp=true&resize=300,272"
                      ),
                      ResultRecipeCard(
                          "Monday",
                          "Vegan chickpea",
                          10,
                          "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/sweet-potato-curry-46f4bc8.jpg?quality=90&webp=true&resize=300,272"
                      ),
                      ResultRecipeCard(
                          "Monday",
                          "Vegan chickpea",
                          10,
                          "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/sweet-potato-curry-46f4bc8.jpg?quality=90&webp=true&resize=300,272"
                      ),
                      ResultRecipeCard(
                          "Monday",
                          "Vegan chickpea",
                          10,
                          "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/sweet-potato-curry-46f4bc8.jpg?quality=90&webp=true&resize=300,272"
                      ),
                      ResultRecipeCard(
                          "Monday",
                          "Vegan chickpea",
                          10,
                          "https://images.immediate.co.uk/production/volatile/sites/30/2020/08/sweet-potato-curry-46f4bc8.jpg?quality=90&webp=true&resize=300,272"
                      ),
                    ]
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
          Text('Time', style: textTheme.labelLarge),
          const SizedBox(height: 5.0),
          Wrap(
            spacing: 5.0,
            children: TimeFilter.values.map((TimeFilter exercise) {
              return FilterChip(
                backgroundColor: Colors.white,
                selectedColor: AppColors.primaryColor,
                showCheckmark: false,
                side: const BorderSide(width: 1.0, color: AppColors.primaryColor),
                label: Text(exercise.name),
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
          Text('Category', style: textTheme.labelLarge),
          const SizedBox(height: 5.0),
          Wrap(
            spacing: 5.0,
            children: CategoryFilter.values.map((CategoryFilter exercise) {
              return FilterChip(
                backgroundColor: Colors.white,
                selectedColor: AppColors.primaryColor,
                showCheckmark: false,
                side: const BorderSide(width: 1.0, color: AppColors.primaryColor),
                label: Text(exercise.name),
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
            style: textTheme.labelLarge,
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
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
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