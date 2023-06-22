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
  List? _output = [];
  var _output_seen = Set<String>();
  List? _uioutput = [];

  @override
  void initState(){
    super.initState();
    loadModel().then((value) async {
      await Future.forEach(widget.images, (item) async {
        await detectImage(File(item.path));
        //await Future.delayed(const Duration(seconds: 3));
      });
    }).then((value){
      setState(() {
        _uioutput = _output?.where((item) => _output_seen.add(item["detectedClass"])).toList();
      });
    });
  }

  loadModel() async{
    Tflite.close();
    await Tflite.loadModel(
        model: 'assets/models/ssd_mobilenet.tflite',
        labels: 'assets/models/ssd_mobilenet.txt'
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
      output[i]["image"] = image;
      debugPrint('The following label was found: ${output[i]["detectedClass"]} at ${output[i]["confidenceInClass"]}');
    }

    setState(() {
      _output?.addAll(output);
      print(_output);
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
                    "This are your images",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Circular",
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        for (var item in _uioutput!)...[
                          SizedBox(
                            height: 20,
                          ),
                          Image.file(item["image"],
                            width: MediaQuery.of(context).size.width * 0.80,
                            height: MediaQuery.of(context).size.width * 0.46,
                            fit: BoxFit.cover,),
                        ]
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                        for (var item in _uioutput!)...[
                          IngredientDetectedBox(widget._IngredientsImages.getPicture(item["detectedClass"]), item["detectedClass"], item["confidenceInClass"]),
                        ]
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
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
                                  builder: (context) => SearchResultView(output: _output),
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
                                    builder: (context) => WeekMenu(output: _output),
                                  ),
                                );
                              },
                              child: Text("Show week menu", style: TextStyle(color: Colors.white))
                          )
                      )
                    ],
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
