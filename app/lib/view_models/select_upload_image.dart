
import 'package:app/views/tensorflow_result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/utils/colors.dart';

class SelectUploadImage extends StatefulWidget {
  const SelectUploadImage({Key? key}) : super(key: key);

  @override
  State<SelectUploadImage> createState() => _SelectUploadImageState();
}

class _SelectUploadImageState extends State<SelectUploadImage> {
  final List<XFile> _images = [];
  late Widget _widgetHolder;

  Future _pickImage(String sourceType, ImageSource source) async {
    try {
      if (sourceType == "camera") {
        final image = await ImagePicker().pickImage(source: source);
        if (image == null) return;
        _images.add(image);
        setState(() {
          _widgetHolder = _secondWidget();
        });
      } else {
        final List<XFile>? images = await ImagePicker().pickMultiImage();
        if (images == null) return;
        setState(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TensorflowResult(images: images),
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
    _widgetHolder = _firstWidget();
    super.initState();
  }

  Widget _firstWidget() {
    return Dialog(
      child: Container(
        height: 300,
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
                  "Take a Picture(s)",
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
                  side: MaterialStateProperty.resolveWith<BorderSide>(
                        (states) => const BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.fromLTRB(60, 20, 60, 20),
                  ),
                ),
                child: const Text(
                  "Select Picture(s)",
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

  Widget _secondWidget() {
    return Dialog(
      child: Container(
        height: 300,
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
                  "Prendre plus de photos",
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
                        builder: (context) => TensorflowResult(images: _images),
                      ),
                    );
                  });
                },
                style: ButtonStyle(
                  side: MaterialStateProperty.resolveWith<BorderSide>(
                        (states) => const BorderSide(
                      color: Colors.green,
                      width: 1.0,
                    ),
                  ),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.fromLTRB(60, 20, 60, 20),
                  ),
                ),
                child: const Text(
                  "Plus besoin",
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
    return _widgetHolder;
  }
}
