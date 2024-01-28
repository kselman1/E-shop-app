// product_details_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/bloc/product_bloc.dart';
import 'package:shopping_app/app/data/models/product.dart';
import 'package:shopping_app/app/modules/home/widgets/option_popup.dart';
import 'package:shopping_app/app/modules/home/widgets/product_update.dart';


class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxW=MediaQuery.of(context).size.width;
    String categ=product.category ?? '';
    String capitalCateg=categ[0].toUpperCase() + categ.substring(1).toLowerCase();
    return Scaffold(
       appBar: AppBar(
        title: const Text(''),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: (16/390)*maxW),
            child: GestureDetector(
              onTap: (){
                 showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return EditDeleteBottomSheet(
                        text: product.title ?? ' ',
                        onEdit: () {
                          Navigator.pop(context); // Close the bottom sheet
                          _navigateToUpdatePage(context);
                        },
                        onDelete: () {
                          Navigator.pop(context); // Close the bottom sheet
                          _handleDelete(context);
                        },
                      );
                    },
                  );
              },
              child: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset('assets/images/Pen.png'),)
            ),
          ),
         
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 380,
              child: Image.network(
                product.image ?? '',
                height: 379.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color: Color(0xFFF5F5F5,)
              ),
                       child: Padding(
                         padding: EdgeInsets.symmetric(horizontal: (16/390)*maxW),
                         child: Column(
                                     children:[
                                   Text(
                                     product.title ?? '',
                                     style: const  TextStyle(
                          fontFamily: 'Rubik',
                          color: Color(0xFF92140C),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600
                                             ),),
                                   
                         const SizedBox(height: 10.0),
                                   Align(
                                    alignment: Alignment.centerLeft,
                                     child: Text(
                                       '\$${product.price ?? ''}',
                                       style: const  TextStyle(
                                                               fontFamily: 'Rubik',
                                                               color: Colors.black,
                                                               fontSize: 32.0,
                                                               fontWeight: FontWeight.w600
                                               ),
                                     ),
                                   ),
                                   
                                   const SizedBox(height: 15.0),
                         const  Divider(height: 1,
                                   color: Color(0xFFE0E0E0),
                                   ),
                         
                                   const SizedBox(height: 15.0),
                                   Align(
                                    alignment: Alignment.centerLeft,
                                     child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Column(
                                        
                                           children: [
                                             const Text(
                                               'CATEGORY:',
                                               style:  TextStyle(
                                                       fontFamily: 'Rubik',
                                                       color: Colors.black,
                                                       fontSize: 14.0,
                                                       fontWeight: FontWeight.w400
                                               ),
                                             ),
                                             Text(
                                               capitalCateg,
                                                              style:  const TextStyle(
                                                               fontFamily: 'Rubik',
                                                               color: Color(0xFF92140C),
                                                               fontSize: 16.0,
                                                               fontWeight: FontWeight.w400
                                               ),
                                             ),
                                           ],
                                         ),
                                          Column(
                                           children: [
                                             const Text(
                                               'RATING:',
                                               style:  TextStyle(
                                                               fontFamily: 'Rubik',
                                                               color: Colors.black,
                                                               fontSize: 14.0,
                                                               fontWeight: FontWeight.w400
                                               ),
                                             ),
                                             Text(
                                               product.category ?? '',
                                                              style:  const TextStyle(
                                                               fontFamily: 'Rubik',
                                                               color: Color(0xFF92140C),
                                                               fontSize: 16.0,
                                                               fontWeight: FontWeight.w400
                                               ),
                                             ),
                                           ],
                                         ),
                                       ],
                                     ),
                                   ),
                                   const SizedBox(height: 15,),
                                    const Text(
                                             'DESCRIPTION:',
                                             style:  TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400
                                             ),
                                           ),
                                   Text(
                                     
                                     product.description ?? '',
                                      style:  const TextStyle(
                          fontFamily: 'Rubik',
                          color: Color(0xFF92140C),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400
                                             ),
                                     textAlign: TextAlign.justify,
                                   ),
                              const SizedBox(height: 100,)
                                     ],),
                       ),
            ),
          ],
        ),
      ),
    );
  }
  void _navigateToUpdatePage(BuildContext context) {
  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateProductPage(product: product),
          ),
        );
}




void _handleDelete(BuildContext context) {
  // Dispatch a DeleteProductEvent to trigger the deletion logic in the ProductBloc
  context.read<ProductBloc>().add(DeleteProductEvent(product.id ?? 0));
  
  // Navigate back after deleting
  Navigator.pop(context);
}

}
