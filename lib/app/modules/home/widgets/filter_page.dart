import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/bloc/color_bloc.dart';
import 'package:shopping_app/app/bloc/color_state.dart';
import 'package:shopping_app/app/bloc/product_bloc.dart';
import 'package:shopping_app/app/common/custom_button.dart';

class FilterPage extends StatefulWidget {
  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    double maxW = MediaQuery.of(context).size.width;
    String category = '';
    String priceSort = '';
    int numOfRes = 0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: (16 / 390) * maxW),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: 3,
                      child: Image.asset('assets/images/blck_line.png')),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Filter',
                  style: TextStyle(
                      fontFamily: 'Rubik',
                      color: Color(0xFF92140C),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 15.0),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Categories',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 15.0),
                BlocBuilder<ColorBloc, ColorState>(
                  builder: (context, colorState) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            category = 'All';
                            context.read<ColorBloc>().add(
                                  ChangeColorEvent(
                                    firstColor: const Color(0xFFFFF8F0),
                                    secondColor: const Color(0xFF92140C),
                                    elementName: 'All',
                                  ),
                                );
                          },
                          child: CustomButton(
                            text: 'All',
                            backgroundColor: const Color(0xFFFFF8F0),
                            width: (38 / 390) * maxW,
                            height: 41,
                            textColor: Colors.black,
                            image: '',
                            borderColor:
                                colorState.selectedElements.contains('All')
                                    ? const Color(0xFF92140C)
                                    : const Color(0xFFFFCF99),
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              //  context.read<ProductBloc>().add(FetchProductsByCategoryEvent('electronics'));
                              category = 'electronics';
                              context.read<ColorBloc>().add(
                                    ChangeColorEvent(
                                      firstColor: const Color(0xFFFFF8F0),
                                      secondColor: const Color(0xFF92140C),
                                      elementName: 'electronics',
                                    ),
                                  );
                            },
                            child: CustomButton(
                              text: 'Electronics',
                              backgroundColor: const Color(0xFFFFF8F0),
                              width: (77 / 390) * maxW,
                              height: 41,
                              textColor: Colors.black,
                              image: '',
                              borderColor: colorState.selectedElements
                                      .contains('electronics')
                                  ? const Color(0xFF92140C)
                                  : const Color(0xFFFFCF99),
                              fontSize: 13,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              // context.read<ProductBloc>().add(FetchProductsByCategoryEvent('jewelery'));
                              context.read<ColorBloc>().add(
                                    ChangeColorEvent(
                                      firstColor: const Color(0xFFFFF8F0),
                                      secondColor: const Color(0xFF92140C),
                                      elementName: 'jewelery',
                                    ),
                                  );
                              category = 'jewelery';
                            },
                            child: CustomButton(
                                text: 'Jewelry',
                                backgroundColor: const Color(0xFFFFF8F0),
                                width: (65 / 390) * maxW,
                                height: 41,
                                textColor: Colors.black,
                                image: '',
                                borderColor: colorState.selectedElements
                                        .contains('jewelery')
                                    ? const Color(0xFF92140C)
                                    : const Color(0xFFFFCF99),
                                fontSize: 13)),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              // context.read<ProductBloc>().add(FetchProductsByCategoryEvent('men\'s clothing'));
                              context.read<ColorBloc>().add(
                                    ChangeColorEvent(
                                      firstColor: const Color(0xFFFFF8F0),
                                      secondColor: const Color(0xFF92140C),
                                      elementName: 'men\'s clothing',
                                    ),
                                  );
                              category = 'men\'s clothing';
                            },
                            child: CustomButton(
                                text: 'Men\'s clothing',
                                backgroundColor: const Color(0xFFFFF8F0),
                                width: (102 / 390) * maxW,
                                height: 41,
                                textColor: Colors.black,
                                image: '',
                                borderColor: colorState.selectedElements
                                        .contains('men\'s clothing')
                                    ? const Color(0xFF92140C)
                                    : const Color(0xFFFFCF99),
                                fontSize: 13)),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Sort by price',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<ColorBloc, ColorState>(
                  builder: (context, colorState) {
                    return Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              priceSort = 'asc';
                              context.read<ColorBloc>().add(
                                    ChangeColorEvent(
                                      firstColor: const Color(0xFFFFF8F0),
                                      secondColor: const Color(0xFF92140C),
                                      elementName: 'high',
                                    ),
                                  );
                            },
                            child: CustomButton(
                                text: 'Highest price',
                                backgroundColor: const Color(0xFFFFF8F0),
                                width: (90 / 390) * maxW,
                                height: 41,
                                textColor: Colors.black,
                                image: '',
                                borderColor:
                                    colorState.selectedElements.contains('high')
                                        ? const Color(0xFF92140C)
                                        : const Color(0xFFFFCF99),
                                fontSize: 13)),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                            onTap: () {
                              priceSort = 'desc';
                              context.read<ColorBloc>().add(
                                    ChangeColorEvent(
                                      firstColor: const Color(0xFFFFF8F0),
                                      secondColor: const Color(0xFF92140C),
                                      elementName: 'low',
                                    ),
                                  );
                            },
                            child: CustomButton(
                                text: 'Lowest price',
                                backgroundColor: const Color(0xFFFFF8F0),
                                width: (90 / 390) * maxW,
                                height: 41,
                                textColor: Colors.black,
                                image: '',
                                borderColor:
                                    colorState.selectedElements.contains('low')
                                        ? const Color(0xFF92140C)
                                        : const Color(0xFFFFCF99),
                                fontSize: 13)),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Number of results',
                    style: TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                BlocBuilder<ColorBloc, ColorState>(
                  builder: (context, colorState) {
                    return Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              numOfRes = 5;
                              context.read<ColorBloc>().add(
                                    ChangeColorEvent(
                                      firstColor: const Color(0xFFFFF8F0),
                                      secondColor: const Color(0xFF92140C),
                                      elementName: '5',
                                    ),
                                  );
                            },
                            child: CustomButton(
                                text: '5',
                                backgroundColor: const Color(0xFFFFF8F0),
                                width: (37 / 390) * maxW,
                                height: 41,
                                textColor: Colors.black,
                                image: '',
                                borderColor:
                                    colorState.selectedElements.contains('5')
                                        ? const Color(0xFF92140C)
                                        : const Color(0xFFFFCF99),
                                fontSize: 13)),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                            onTap: () {
                              numOfRes = 10;
                              context.read<ColorBloc>().add(
                                    ChangeColorEvent(
                                      firstColor: const Color(0xFFFFF8F0),
                                      secondColor: const Color(0xFF92140C),
                                      elementName: '10',
                                    ),
                                  );
                            },
                            child: CustomButton(
                                text: '10',
                                backgroundColor: const Color(0xFFFFF8F0),
                                width: (37 / 390) * maxW,
                                height: 41,
                                textColor: Colors.black,
                                image: '',
                                borderColor:
                                    colorState.selectedElements.contains('10')
                                        ? const Color(0xFF92140C)
                                        : const Color(0xFFFFCF99),
                                fontSize: 13)),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                            onTap: () {
                              numOfRes = 20;
                              context.read<ColorBloc>().add(
                                    ChangeColorEvent(
                                      firstColor: const Color(0xFFFFF8F0),
                                      secondColor: const Color(0xFF92140C),
                                      elementName: '20',
                                    ),
                                  );
                            },
                            child: CustomButton(
                                text: '20',
                                backgroundColor: const Color(0xFFFFF8F0),
                                width: (37 / 390) * maxW,
                                height: 41,
                                textColor: Colors.black,
                                image: '',
                                borderColor:
                                    colorState.selectedElements.contains('20')
                                        ? const Color(0xFF92140C)
                                        : const Color(0xFFFFCF99),
                                fontSize: 13)),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                            onTap: () {
                              numOfRes = 50;
                              context.read<ColorBloc>().add(
                                    ChangeColorEvent(
                                      firstColor: const Color(0xFFFFF8F0),
                                      secondColor: const Color(0xFF92140C),
                                      elementName: '50',
                                    ),
                                  );
                            },
                            child: CustomButton(
                                text: '50',
                                backgroundColor: const Color(0xFFFFF8F0),
                                width: (37 / 390) * maxW,
                                height: 41,
                                textColor: Colors.black,
                                image: '',
                                borderColor:
                                    colorState.selectedElements.contains('50')
                                        ? const Color(0xFF92140C)
                                        : const Color(0xFFFFCF99),
                                fontSize: 13)),
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                const Divider(
                  height: 1,
                  color: Color(0xFFE0E0E0),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                    onTap: () {
                      context.read<ProductBloc>().add(
                            FilterProductsEvent(
                              category: category,
                              sortBy: priceSort,
                              numberOfResults: numOfRes,
                            ),
                          );
                      Navigator.pop(context);
                    },
                    child: CustomButton(
                        text: 'Apply filter',
                        backgroundColor: const Color(0xFF5E0F0A),
                        width: (358 / 390) * maxW,
                        height: 53,
                        textColor: Colors.white,
                        image: '',
                        borderColor: Colors.transparent)),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CustomButton(
                        text: 'Cancel',
                        backgroundColor: Colors.white,
                        width: (358 / 390) * maxW,
                        height: 53,
                        textColor: const Color(0xFF5E0F0A),
                        image: '',
                        borderColor: const Color(0xFF5E0F0A))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
