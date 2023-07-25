import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social/screens/signup.dart';
import 'package:social/widgets/Textbutton.dart';
import 'package:social/widgets/mainbtton.dart';
import 'package:social/widgets/textfield.dart';

import '../providers/login_provider.dart';

class LOGINVIEW extends StatelessWidget {
   LOGINVIEW({super.key});
   final _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Consumer<LoginProvider>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  left: 22,
                  right: 22,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      "LOGIN",
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                     Text(
                      "You've Been Missed!",
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 42,
                    ),
                    TEXTFIELD(controller: value.email, text: "Email",
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field cannot be empty ';
                    } else {
                      return null;
                    }
                  }),
                    const SizedBox(
                      height: 35,
                    ),
                    TEXTFIELD(controller: value.password, text: "Password",validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field cannot be empty ';
                    } else {
                      return null;
                    }
                  }),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 220,
                      ),
                      child: TEXTBUTTON(
                        onpressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => REGISTER(),));
                        },
                        text:"Register Now",
                        
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Mainbutton(
                      onpressed: (){
                        if(_formKey.currentState!.validate())
                        {
                        value.login(context);}
                      },
                      text: "Login",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 200),
                      child: TEXTBUTTON(
                          onpressed: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //        return const HomeView();
                            //     },
                            //   ),
                            // );
                          },
                          text:" Forget Password!"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                   
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}