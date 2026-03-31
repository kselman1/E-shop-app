import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/bloc/color_state.dart';
import 'package:shopping_app/app/bloc/color_bloc.dart';
import 'package:shopping_app/app/bloc/product_bloc.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  List<String> categories = ['All', 'Electronics', 'Men\'s Clothing'];
  List<String> catg = ['aa', 'electronics', 'men\'s clothing'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color(0xFFFFF8F0),
      ),
      child: BlocBuilder<ColorBloc, ColorState>(
        builder: (context, colorState) {
          // Using a Row with Expanded ensures the 3 items fill the screen width perfectly
          return Row(
            children: List.generate(categories.length, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    // --- YOUR ORIGINAL ONTAP LOGIC START ---
                    context.read<ColorBloc>().add(
                          ChangeColorEvent(
                            firstColor: const Color(0xFF92140C),
                            secondColor: const Color(0xFFFFF8F0),
                            elementName: categories[index],
                          ),
                        );
                    if (index == 0) {
                      context.read<ProductBloc>().add(FetchProductsEvent());
                    } else {
                      context.read<ProductBloc>().add(FetchProductsByCategoryEvent(catg[index]));
                    }
                    // --- YOUR ORIGINAL ONTAP LOGIC END ---
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: colorState.selectedElements.contains(categories[index])
                          ? const Color(0xFF92140C)
                          : const Color(0xFFFFF8F0),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13, // Slightly smaller to ensure "Men's Clothing" fits
                          fontWeight: FontWeight.w500,
                          color: colorState.selectedElements.contains(categories[index])
                              ? Colors.white
                              : const Color(0xFF92140C),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}