
import 'package:flutter/material.dart';


class Roundedbutton extends StatelessWidget {
  const Roundedbutton({super.key, required this.onpressed, });

  final Function()  onpressed;
  // final String img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: const CircleAvatar(
        minRadius: 30,
      ),
    );
  }
}