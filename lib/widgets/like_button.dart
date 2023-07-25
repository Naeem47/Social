import 'package:flutter/material.dart';

class LIKEBUTTON extends StatelessWidget {
  const LIKEBUTTON({super.key, required this.ontap, required this.isliked});
  final bool isliked;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Icon(
        isliked ? Icons.favorite : Icons.favorite_border,
        color: isliked ? Colors.red : Colors.grey,
      ),
    );
  }
}
