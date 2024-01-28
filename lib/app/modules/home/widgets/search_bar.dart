// search_bar.dart
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;

  CustomSearchBar({required this.controller, required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Search...',
            suffixIcon: IconButton(
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
