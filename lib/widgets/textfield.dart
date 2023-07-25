
import 'package:flutter/material.dart';
import 'package:social/constants/Colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TEXTFIELD extends StatelessWidget {
  const TEXTFIELD({super.key,required this. controller,required this.text,required this.validator});

  final TextEditingController controller;
  final String text;
  final validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      maxLines: 10,
      controller: controller,
      
      decoration: InputDecoration(

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: ColorConstant.grey,
          )
        ),
        filled: true,
        fillColor: ColorConstant.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: ColorConstant.grey,
          )
        ),
        hintText: text,
        hintStyle: GoogleFonts.urbanist(
          color: ColorConstant.black
        ),
      ),
       validator: validator,
       style: TextStyle(color: ColorConstant.black),
                  );
    
  }
}