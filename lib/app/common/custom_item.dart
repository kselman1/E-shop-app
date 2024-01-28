// custom_nav_item.dart

import 'package:flutter/material.dart';

class CustomNavItem extends StatelessWidget {
  final String category;
  final bool isClicked;
  final Function() onTap;

  const CustomNavItem({
    required this.category,
    required this.isClicked,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 20,
        width: 20,
        padding: EdgeInsets.all(8.0),
        color: Colors.black,
        decoration: BoxDecoration(
          color: isClicked ? Colors.red : Colors.yellow,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          category,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
