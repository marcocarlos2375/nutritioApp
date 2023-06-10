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
  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final img = File(image.path);
      setState(() {
        _image = img;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TensorflowResult(),
          ),
        );
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.5,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.20,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  _pickImage(ImageSource.camera);
                },
                child: Text(
                  "Take pictures",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontFamily: "Circular",
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
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
}

