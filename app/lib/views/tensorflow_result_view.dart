import 'dart:io';

import 'package:app/utils/fontFamily.dart';
import 'package:app/views/searchResult_view.dart';
import 'package:app/views/week_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/colors.dart';
import '../view_models/footer_view_model.dart';
import '../view_models/select_upload_image.dart';

class TensorflowResult extends StatefulWidget {
  final List<XFile> images;
  const TensorflowResult({super.key, required this.images});

  @override
  State<TensorflowResult> createState() => _TensorflowResult();
}

class _TensorflowResult extends State<TensorflowResult> {

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
        body: _FilterButton(images: widget.images),
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
  final List<XFile> images;
  const _FilterButton({required this.images});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Select the next step",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Circular",
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SearchResultView(),
                        ),
                      );
                    },
                    child: Text("Show recipe", style: TextStyle(color: Colors.white))
                  ),
                ),
                SizedBox(width: 30),
                Container(
                  width: 150,
                  decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                           builder: (context) => WeekMenu(),
                          ),
                        );
                      },
                      child: Text("Show week menu", style: TextStyle(color: Colors.white))
                  )
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            for (var item in images)
            Center(
              child: Container(
                width: 500,
                height: 350,
                child: Image.file(File(item.path)),
              )
            ),
            Text(
              "Following incredients detected",
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Circular",
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 217, 217, 217),
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: const Image(
                            height: 52,
                            width: 52,
                            image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                          )
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "Product Name",
                        style: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFontFamily.fontFamily,
                        fontWeight: FontWeight.w600),
                      ),
                    ]
                  )
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 217, 217, 217),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: const Image(
                                height: 52,
                                width: 52,
                                image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                              )
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            "Product Name",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFontFamily.fontFamily,
                                fontWeight: FontWeight.w600),
                          ),
                        ]
                    )
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 217, 217, 217),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: const Image(
                              height: 52,
                              width: 52,
                              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                            )
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            "Product Name",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: AppFontFamily.fontFamily,
                                fontWeight: FontWeight.w600),
                          ),
                        ]
                    )
                ),
              ],
            ),
          ],
        )
    );
  }
}