// search_bar.dart
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;

  CustomSearchBar({required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    double maxW=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: const Color(0xFFFFF8F0)),
        width: (298/390)*maxW,
        height: 48,
      child: TextField(
  controller: controller,
  decoration: InputDecoration(
    border: InputBorder.none,
    hintText: 'Search...',
    contentPadding: EdgeInsets.only(left: 20.0, top: 10),
    prefixIcon: IconButton(
      onPressed: () {
        onSubmitted(controller.text);
      },
      icon: const Icon(Icons.search),
    ),
  ),
  onSubmitted: onSubmitted,
),

      ),
    );
  }
}
