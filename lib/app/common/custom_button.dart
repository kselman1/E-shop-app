import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final String? image;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double width;
  final double height;
  final double? fontSize;
  

  CustomButton({
    required this.text,
    this.image,
    required this.backgroundColor,
    required this.width ,
    required this.height, 
    required this.textColor, required this.borderColor, this.fontSize,
    
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: borderColor)
      ),
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           if (image!.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset('assets/images/$image')),
            ),
          ],
          Text(
            text,
             style:  TextStyle(
                        fontFamily: 'Rubik',
                        color: textColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w600
                      ),),
         
          
        ],
      ),
    );
  }
}
