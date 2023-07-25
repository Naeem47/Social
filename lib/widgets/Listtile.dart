import 'package:flutter/material.dart';
class LISTTILE extends StatelessWidget {
  const LISTTILE({super.key,required this.icon,required this.titlee, this.ontap,});
 final void Function()? ontap;
 final Icon icon;
 final String titlee;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: ListTile(
        leading: icon,
        title: Text(titlee),
      ),
    );
  }
}