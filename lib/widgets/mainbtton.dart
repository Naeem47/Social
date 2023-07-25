
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social/constants/Colors.dart';

class Mainbutton extends StatelessWidget {
  const Mainbutton({super.key, required this.onpressed, required this.text});

  final Function()  onpressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(331, 56),
        backgroundColor: ColorConstant.black,
        foregroundColor: ColorConstant.black,
      ),
      child: Text(
        text,
        style: GoogleFonts.urbanist(
          fontSize: 15,
          color: ColorConstant.white,
        ),
      ),
      
    );
  }
}