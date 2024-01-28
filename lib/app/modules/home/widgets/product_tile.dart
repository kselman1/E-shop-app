import 'package:flutter/material.dart';
import 'package:shopping_app/app/data/models/product.dart';
import 'package:shopping_app/app/modules/home/widgets/product_page.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(product: product),
          ),
        );
      },
      child: Card(
        elevation: 2.0,
       // margin: const EdgeInsets.all(8.0),
        color: const Color(0xFFF5F5F5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(product.image ?? ''), 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
            
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category?.toUpperCase() ?? '',
                      style: const TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                        fontSize: 8.0,
                      ),
                    ),
                    Text(
                      product.title ?? '',
                      style: const TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                        color: Color(0xFF92140C)
                      ),
                    ),
                    Text(
                       '\$${product.price ?? ''}',
                      style: const TextStyle(
                        fontFamily: 'Rubik',
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
