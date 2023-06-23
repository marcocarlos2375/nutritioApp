import 'dart:io';

import 'package:app/utils/fontFamily.dart';
import 'package:app/views/searchResult_view.dart';
import 'package:app/views/week_menu.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/colors.dart';
import '../utils/ingredientsImages.dart';
import '../view_models/footer_view_model.dart';
import '../view_models/ingredientDetectedBox.dart';
import '../view_models/select_upload_image.dart';
import 'package:tflite/tflite.dart';

class TensorflowResult extends StatefulWidget {
  final List<XFile> images;
  List<Widget> itemList = [];
  List<String> ingr = ["broccoli", "orange", "carrot", "banana", "apple"];
  List<String> imagesIngr = [
    "https://img.rewe-static.de/1007433/21403678_digital-image.png?impolicy=s-products&imwidth=240&output-format=image/webp",
    "https://ekomarkt.de/media/image/product/30687/lg/orangen-im-netz-bio-1kg.jpg",
    "https://img.rewe-static.de/1045111/21288882_digital-image.png?impolicy=s-products&imwidth=240&output-format=image/webp",
    "https://img.rewe-static.de/1028378/33873287_digital-image.png?impolicy=s-products&imwidth=240&output-format=image/webp",
    "https://img.rewe-static.de/0136053/24569357_digital-image.png?impolicy=s-products&imwidth=240&output-format=image/webp"
  ];

  IngredientsImages _IngredientsImages = IngredientsImages();

  TensorflowResult({super.key, required this.images}) {
    for (int i = 0; i < ingr.length; i++) {
      itemList.add(
        ListTile(
          leading: Image.network(
            imagesIngr[i],
            height: 20,
          ),
          title: Text(ingr[i]),
        ),
      );
    }
  }

  @override
  State<TensorflowResult> createState() => _TensorflowResult();
}

class _TensorflowResult extends State<TensorflowResult> {
  bool _loading = true;
  List? _output = [];
  var _output_seen = Set<String>();
  List? _uioutput = [];

  @override
  void initState() {
    super.initState();
    loadModel().then((value) async {
      await Future.forEach(widget.images, (item) async {
        await detectImage(File(item.path));
        //await Future.delayed(const Duration(seconds: 3));
      });
    }).then((value) {
      setState(() {
        _uioutput = _output
            ?.where((item) => _output_seen.add(item["detectedClass"]))
            .toList();
      });
    });
  }

  loadModel() async {
    Tflite.close();
    await Tflite.loadModel(
        model: 'assets/models/ssd_mobilenet.tflite',
        labels: 'assets/models/ssd_mobilenet.txt');
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
      debugPrint(
          'The following label was found: ${output[i]["detectedClass"]} at ${output[i]["confidenceInClass"]}');
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
                    "Selected Images",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Circular",
                        fontWeight: FontWeight.w600),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        for (var item in _uioutput!) ...[
                          SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                // Rayon de bordure de l'image
                                child: Image.file(
                                  item["image"],
                                  width:
                                      MediaQuery.of(context).size.width * 0.80,
                                  height:
                                      MediaQuery.of(context).size.width * 0.5,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                // Position verticale du badge depuis le haut de l'image
                                left: 10,
                                // Position horizontale du badge depuis la droite de l'image
                                child: Container(
                                  padding: EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    color: Colors.green, // Couleur du badge
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Rayon de bordure du badge
                                  ),
                                  child: Text(
                                    '${item["detectedClass"]} : ${item["confidenceInClass"]}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        // Couleur du texte du badge
                                        fontSize: 12,
                                        fontFamily: AppFontFamily
                                            .fontFamily // Taille de police du texte du badge
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  Text(
                    "Ingredients Detected",
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
                    child: Container(
                      color: Colors.grey.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            for (var item in _uioutput!) ...[
                              if (widget._IngredientsImages.contains(
                                  item["detectedClass"])) ...[
                                IngredientDetectedBox(
                                    widget._IngredientsImages.getPicture(
                                        item["detectedClass"]),
                                    item["detectedClass"],
                                    item["confidenceInClass"]),
                              ]
                            ]
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.80,
                        decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SearchResultView(output: _output),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Show Recipes",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: AppFontFamily.fontFamily)),
                            )),
                      ),
                      SizedBox(height: 10),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: AppColors.primaryColor, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        WeekMenu(output: _output),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Show week menu",
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontFamily: AppFontFamily.fontFamily)),
                              ))),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  'Ingredients that you Can detect',
                                  style: TextStyle(
                                      fontFamily: AppFontFamily.fontFamily),
                                ),
                                content: Column(children: [
                                  Container(
                                    height: 300,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          for (int i = 0;
                                              i < widget.ingr.length;
                                              i++)
                                            Row(
                                              children: [
                                                Image.network(
                                                  "${widget.imagesIngr[i]}",
                                                  width: 50,
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "${widget.ingr[i]}",
                                                  style: TextStyle(
                                                      fontFamily: AppFontFamily
                                                          .fontFamily),
                                                ),
                                              ],
                                            )
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          'Which ingredients Can I detect ?',
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontFamily: AppFontFamily.fontFamily),
                        ),
                      )
                    ],
                  ),
                ],
              )),
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
