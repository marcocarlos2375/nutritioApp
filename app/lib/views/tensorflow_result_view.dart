import 'dart:io';

import 'package:app/utils/fontFamily.dart';
import 'package:app/views/searchResult_view.dart';
import 'package:app/views/week_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/colors.dart';
import '../utils/ingredientsImages.dart';
import '../view_models/footer_view_model.dart';
import '../view_models/ingredientDetectedBox.dart';
import '../view_models/select_upload_image.dart';
import 'package:tflite/tflite.dart';


class TensorflowResult extends StatefulWidget {
  final List<XFile> images;
  IngredientsImages _IngredientsImages = IngredientsImages();

  TensorflowResult({super.key, required this.images});

  @override
  State<TensorflowResult> createState() => _TensorflowResult();
}

class _TensorflowResult extends State<TensorflowResult> {
  bool _loading = true;
  List? _output;

  @override
  void initState(){
    super.initState();
    loadModel().then((value){
      detectImage(File(widget.images[0].path));
    }).then((value){
      setState(() {});
    });
  }

  loadModel() async{
    Tflite.close();
    await Tflite.loadModel(
        model: 'assets/model/ssd_mobilenet.tflite',
        labels: 'assets/model/ssd_mobilenet.txt'
    );
    debugPrint("TFLite Model loaded!");
  }

  detectImage(File image) async {
    var output = await Tflite.detectObjectOnImage(
        path: image.path,
        model: "SSDMobileNet",
        threshold: 0.6,
        imageMean: 127.5,
        imageStd: 127.5);

    for (var i = 0; i < output!.length; i++) {
      debugPrint('The following label was found: ${output![i]["detectedClass"]}');
    }

    setState(() {
      _output = output;
      _loading = false;
    });
  }

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
        body: SingleChildScrollView(
          child: Padding(
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
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        for (var item in _output!)
                          IngredientDetectedBox(widget._IngredientsImages.getPicture(item["detectedClass"]), item["detectedClass"]),
                      ],
                    ),
                  ),
                ],
              )
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
