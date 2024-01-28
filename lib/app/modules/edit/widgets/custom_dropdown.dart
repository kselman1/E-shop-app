import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String initialCategory;
  final Function(String) onCategoryChanged; 

  CustomDropdown({required this.initialCategory, required this.onCategoryChanged});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}
class _CustomDropdownState extends State<CustomDropdown> {
  String selectedOption = '';

  @override
  void initState() {
    super.initState();
    
    selectedOption = capitalize(widget.initialCategory);

    if (!dropdownItems.contains(selectedOption)) {
      setState(() {
        dropdownItems.insert(0, selectedOption);
      });
    }
  }

  List<String> dropdownItems = [ 'Electronics', 'Jewelry', 'Men\'s clothing', 'Women\'s clothing'];

  @override
  Widget build(BuildContext context) {
    double maxW = MediaQuery.of(context).size.width;
    return Container(
      width: (235 / 390) * maxW,
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFFFCF99), width: 1.0),
        color: const Color(0xFFFFF8F0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButton<String>(
          value: selectedOption,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400, color: Colors.black),
          underline: Container(
            height: 0,
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue!;
            });
            
            widget.onCategoryChanged(selectedOption);
          },
          items: dropdownItems
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  String capitalize(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }
}

