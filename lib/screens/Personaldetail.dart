import 'package:flutter/material.dart';
import 'package:social/widgets/mainbtton.dart';
import 'package:social/widgets/textfield.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/personaldetail.dart';

class Perosnalinfo extends StatelessWidget {
  Perosnalinfo({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: true,
            title: Text("E D I T P R O F I L E", style: GoogleFonts.urbanist(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),),
          ),
          body: SingleChildScrollView(
            child: Consumer<PersonalProvider>(
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
                      height: 25,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          val.pickimage();
                        },
                        child: const  CircleAvatar(
                          
                          radius: 80,
                          // backgroundImage: (val.profilepic!= null)  ? FileImage(val.profilepic!): null,
                          child: Icon(Icons.person,size: 40,) ,
                          backgroundColor: Colors.brown,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TEXTFIELD(
                        controller: val.username, text:"Username",
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
                        controller: val.bio, text: "Bio",
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
                        controller: val.portfolio,
                        text: "Link ",
                        validator: (value) {
                    if (value == null) {
                      return 'Field cannot be empty ';
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
                        val.sendata(context);
                       
                        }
                        
                      },
                      text:"Proceed to the feed",
                    ),
                    const SizedBox(
                      height: 18,
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