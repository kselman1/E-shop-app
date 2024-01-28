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
  List<String> categories = ['All', 'Electronics', 'Jewelry', 'Men\'s Clothing'];
  List<String> catg = ['aa', 'electronics', 'jewelery', 'men\'s clothing'];

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
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  
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
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: context.read<ColorBloc>().state.selectedElements.contains(categories[index])
                        ? const Color(0xFF92140C)
                        : const Color(0xFFFFF8F0),
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: context.read<ColorBloc>().state.selectedElements.contains(categories[index])
                            ? Colors.white
                            : const Color(0xFF92140C),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
