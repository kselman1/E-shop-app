import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(String) onImageChanged;
  final String imagePath;

  ImagePickerWidget({required this.onImageChanged, required this.imagePath});

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  late String _imagePath;

  @override
  void initState() {
    super.initState();
    _imagePath = widget.imagePath;
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery );
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
        widget.onImageChanged(_imagePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Container to display existing image
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.0),
            image: _imagePath.isNotEmpty
                ? DecorationImage(
                    image: FileImage(File(_imagePath)),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
        ),
        const SizedBox(width: 10),
        // Container with + for image picking
        GestureDetector(
          onTap: _pickImage,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
            ),
            child: Center(
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
