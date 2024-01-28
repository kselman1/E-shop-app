import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final double width;
  final double height;

  CustomTextField({
    required this.controller,
    required this.labelText,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFFCF99), width: 1.0),
        borderRadius: BorderRadius.circular(4),
        color:const Color(0xFFFFF8F0),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
        maxLines: null,
        decoration: InputDecoration(
          
          contentPadding: const EdgeInsets.only(bottom: 4, left: 10),
          labelText: labelText,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          
        ),
      ),
    );
  }
}
