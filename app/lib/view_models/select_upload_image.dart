import 'dart:io';
import 'package:app/views/searchResult_view.dart';
import 'package:app/views/tensorflow_result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/utils/colors.dart';

class SelectUploadImage extends StatefulWidget {
  const SelectUploadImage({super.key});

  @override
  State<SelectUploadImage> createState() => _SelectUploadImage();
}

class _SelectUploadImage extends State<SelectUploadImage> {
  //File? _image;
  final _image = <XFile>[];
  late Widget widgetHolder;

  Future _pickImage(String sourceType, ImageSource source) async {
    try {
      if(sourceType == "camera") {
        final image = await ImagePicker().pickImage(source: source);
        if (image == null) return;
        _image.add(image);
        setState(() {
          widgetHolder = secondWidget();
        });

      } else {
        final List<XFile> images = await ImagePicker().pickMultiImage();
        if (images == null) return;
        //final img = File(image.path);
        setState(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TensorflowResult(),
            ),
          );
        });
      }
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    widgetHolder = firstWidget();
    super.initState();
  }

  Widget firstWidget() {
    return Dialog(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  _pickImage("camera", ImageSource.camera);
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                ),
                child: const Text(
                  "Take pictures",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: "Circular",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  _pickImage("gallery", ImageSource.gallery);
                },
                style: ButtonStyle(
                  side:
                  MaterialStateProperty.resolveWith<BorderSide>(
                        (states) =>
                    const BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white),
                  padding:
                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.fromLTRB(60, 20, 60, 20),
                  ),
                ),
                child: const Text(
                  "Select Pictures",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 13,
                    fontFamily: "Circular",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget secondWidget() {
    return Dialog(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  _pickImage("camera", ImageSource.camera);
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                ),
                child: const Text(
                  "Yes please!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: "Circular",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TensorflowResult(),
                      ),
                    );
                  });
                },
                style: ButtonStyle(
                  side:
                  MaterialStateProperty.resolveWith<BorderSide>(
                        (states) =>
                    const BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white),
                  padding:
                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.fromLTRB(60, 20, 60, 20),
                  ),
                ),
                child: const Text(
                  "No more",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 13,
                    fontFamily: "Circular",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widgetHolder;
  }
}