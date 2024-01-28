import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/app/bloc/product_bloc.dart';
import 'package:shopping_app/app/common/custom_button.dart';
import 'package:shopping_app/app/modules/edit/widgets/custom_dropdown.dart';
import 'package:shopping_app/app/common/custom_textfield.dart';
import 'package:shopping_app/app/data/models/product.dart';
import 'package:shopping_app/app/data/service/api_service.dart';
import 'package:shopping_app/app/modules/edit/widgets/image_picker.dart';

class UpdateProductPage extends StatefulWidget {
  final Product product;

  UpdateProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  @override
  Widget build(BuildContext context) {
    double maxW=MediaQuery.of(context).size.width;
    TextEditingController titleController = TextEditingController(text: widget.product.title);
    TextEditingController descriptionController = TextEditingController(text: widget.product.description);
    TextEditingController priceController = TextEditingController(text: widget.product.price.toString());
    String newCategory='';
    String imagePath=widget.product.image??'';

    return Scaffold(
      appBar: AppBar(
       title: Padding(
          padding:  EdgeInsets.only(left: (16/390)*maxW),
          child:  const Text('Update product',  style:  TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700
                        ),),
        ),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 3,
                child: Image.asset('assets/images/blck_line.png')),
            ),
            const SizedBox(height: 10,),
            Text(widget.product.title ?? '',
              style: const TextStyle(
                          fontFamily: 'Rubik',
                          color: Color(0xFF92140C),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600
                        ),
              textAlign: TextAlign.justify,
                        ),
            const SizedBox(height: 15.0),
           const Align(alignment: Alignment.centerLeft,
            child: Text(
              'Title',
             style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600
                        ),
            ),),
             CustomTextField(
          controller: titleController,
          labelText: '',
          width:100, 
          height:50 
        ),
        const SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Align(alignment: Alignment.centerLeft,
            child: Text(
              'Price',
             style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600
                        ),
            ),),
               const SizedBox(height: 15,),
          CustomTextField(
            controller: priceController,
            labelText: '',
            width:(107/390)*maxW, 
            height:48 
          ),
        ],
            ),
           
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Align(alignment: Alignment.centerLeft,
            child: Text(
              'Categories',
             style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600
                        ),
            ),),
             const SizedBox(height: 15,),
          CustomDropdown(initialCategory: widget.product.category ?? '',
          onCategoryChanged: (selectedCategory) {
         newCategory=selectedCategory;
      },),
        ],
            ),
          ],
        ),

        const SizedBox(height: 15,),
         const Align(alignment: Alignment.centerLeft,
            child: Text(
              'Description',
             style: TextStyle(
                          fontFamily: 'Rubik',
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600
                        ),
            ),),
        const SizedBox(height: 15,),
        CustomTextField(
          controller: descriptionController,
          labelText: '',
          width:(358/390)*maxW, 
          height:99 
        ),
        const SizedBox(height: 15),
         ImagePickerWidget(
              product: widget.product,
                onImageChanged: (newImagePath) {
                  setState(() {
                    imagePath = newImagePath;
                  });
                },
                imagePath: imagePath,
              ),
        
             const  SizedBox(height: 15),
            GestureDetector(
              onTap: (){
                final updatedProduct = Product(
                    id: widget.product.id,
                    title: titleController.text,
                    description: descriptionController.text,
                    price: double.tryParse(priceController.text),
                    image: widget.product.image,
                    category: newCategory,
                  );
        
              
                  ApiDataSource().updateProduct(widget.product.id ?? 0, updatedProduct).then((updatedProduct) {
                    
                    context.read<ProductBloc>().add(UpdateProductEvent(updatedProduct));
        
                    
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }).catchError((error) {
                    
                    print('Error updating product: $error');
                  });
              },
              child: CustomButton(text: 'Save', backgroundColor: const Color(0xFF5E0F0A), width:(358/390)*maxW, height: 53, textColor: Colors.white, image: '',borderColor: Colors.transparent,)),
             const SizedBox(height: 15,),
             GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: CustomButton(text: 'Cancel', backgroundColor: Colors.white, width:(358/390)*maxW , height: 53, textColor: const Color(0xFF5E0F0A), image: '',borderColor: const Color(0xFF5E0F0A),),
             )
            ],
          ),
        ),
      ),
    );
  }
}
