import 'package:flutter/material.dart';
import 'package:social/auth/Auth.dart';
import 'package:social/constants/Colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const  Authpage(),
        ));
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.black,
      body: Center(
        child: SizedBox(
            height: 250,
            width: 300,
            child: Image.asset(
              "assets/FEEDBOOK.png",
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
