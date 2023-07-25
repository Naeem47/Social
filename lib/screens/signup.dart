import 'package:flutter/material.dart';
import 'package:social/providers/Signup_provider.dart';
import 'package:social/screens/login.dart';
import 'package:social/widgets/Textbutton.dart';
import 'package:social/widgets/mainbtton.dart';
import 'package:social/widgets/textfield.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class REGISTER extends StatelessWidget {
  REGISTER({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Consumer<SignupProvider>(
              builder: (context, val, child) => Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 22,
                  right: 22,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                     "Register Now !",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                     "Be a Part of Our Community",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                 
                    const SizedBox(
                      height: 40,
                    ),
                    TEXTFIELD(
                        controller: val.email, text:"Email",
                        validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field cannot be empty ';
                    } else {
                      return null;
                    }
                  }),
                    const SizedBox(
                      height: 20,
                    ),
                    TEXTFIELD(
                        controller: val.password, text: "Password",
                        validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field cannot be empty ';
                    } else {
                      return null;
                    }
                  }),
                    const SizedBox(
                      height: 20,
                    ),
                    TEXTFIELD(
                        controller: val.cpassword,
                        text: "Confirm  Password",
                        validator: (value) {
                    if (value == null) {
                      return 'Field cannot be empty ';
                    } 
                    else if (  value != val.password.text){
                      return "Password didnt match";
                    }
                    else {
                      return null;
                    }
                  }),
                  
                  
                   
                    const SizedBox(
                      height: 40,
                    ),
                    Mainbutton(
                      onpressed: ()  {
                           if(_formKey.currentState!.validate())
                        {
                        val.createUser(context);
                       
                        }
                        
                      },
                      text:"Register",
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                         "Already have an account ! ",
                          style: GoogleFonts.urbanist(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TEXTBUTTON(onpressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LOGINVIEW(),));
                        }, text: "Login "),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  //  const  Divider(
                  //     color: Colors.brown,
                  //     height: 2,
                  //   ),
                  //    const SizedBox(
                  //     height: 10,
                  //   ),
                  //    Center(
                  //      child: Text(
                  //          "Register with sso",
                  //           style: GoogleFonts.urbanist(
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //    ),const SizedBox(height: 30,),
                  //  Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //    children: [
                  //      Roundedbutton(onpressed: (){}),
                  //      Roundedbutton(onpressed: (){}),
                  //      Roundedbutton(onpressed: (){}),
                  //    ],
                  //  )
                  
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