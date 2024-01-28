import 'package:flutter/material.dart';
import 'package:shopping_app/app/common/custom_button.dart';

class EditDeleteBottomSheet extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final String text;

  const EditDeleteBottomSheet({
    Key? key,
    required this.onEdit,
    required this.onDelete, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxW=MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      height: 312,
      color: const Color(0xFFF5F5F5),
      padding:const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 3,
              child: Image.asset('assets/images/blck_line.png')),
          ),
          const SizedBox(height: 10,),
          Text(text,
            style: const TextStyle(
                        fontFamily: 'Rubik',
                        color: Color(0xFF92140C),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                      ),
            textAlign: TextAlign.justify,
                      ),
          const SizedBox(height: 15.0),
          const  Divider(height: 1,
                color: Color(0xFFE0E0E0),
            ),
                         
          const SizedBox(height: 15.0),
          GestureDetector(
            onTap: onEdit,
            child: CustomButton(text: 'Edit product', backgroundColor: const Color(0xFF5E0F0A), width: (358/390)*maxW, height: 58, textColor: Colors.white, image: 'pencil-outline.png',borderColor: Colors.transparent,)),
          const SizedBox(height: 16.0),
          GestureDetector(
            onTap: onDelete,
            child: CustomButton(text: 'Delete product', backgroundColor:  Colors.white, width: (358/390)*maxW, height: 58, textColor: const Color(0xFF92140C), image: 'Trash.png',borderColor: const Color(0xFF5E0F0A),)),
         
        ],
      ),
    );
  }
}
