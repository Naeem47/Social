import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:social/constants/Colors.dart';
import 'package:social/providers/drawerprovider.dart';
import 'package:social/providers/homeprovider.dart';
import 'package:social/widgets/Listtile.dart';
import 'package:social/widgets/PostTemplate.dart';
import 'package:social/widgets/textfield.dart';

class HomeView extends StatelessWidget {
 const  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "FEEDBOOK",
          style: GoogleFonts.urbanist(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Consumer<drawerProvider>(
        builder: (context, value, child) {
          return Drawer(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  const Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.brown,
                        child: Icon(
                          Icons.person,
                          size: 60,
                        ),
                      )),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        LISTTILE(
                          icon: value.icons[0],
                          titlee: value.tiles[0],
                          ontap: () {
                            value.home(context);
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        LISTTILE(
                          icon: value.icons[1],
                          titlee: value.tiles[1],
                          ontap: () {
                            value.profile(context);
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        LISTTILE(
                          icon: value.icons[2],
                          titlee: value.tiles[2],
                          ontap: () {
                            value.logout(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Feed')
            .orderBy('TimeStamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
           if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.docs.length,
              separatorBuilder: (context, index) => SizedBox(height: 5,),
              itemBuilder: (BuildContext context, int index) {
                var posts = snapshot.data!.docs[index];
                return PostTemplate(
                  messege: posts['Messege'],
                  email: posts['Email'][0],
                  likes: List<String>.from(posts['Likes']),
                  postid: posts.id,
                );
              },
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          }
        },
      ),
      floatingActionButton:
          Consumer<HomeProvider>(builder: (context, value, child) {
        return FloatingActionButton(
          onPressed: () {
            showBottomSheet(
              enableDrag: true,
              context: context,
              builder: (context) {
                return Container(
                  color: ColorConstant.black,
                  height: 300,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TEXTFIELD(
                            controller: value.post,
                            text: "Post on the feed".toUpperCase(),
                            validator: (val) {
                              if (val == null || val.isEmpty) {
                                return 'Field cannot be empty ';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              value.postmessage(
                                FirebaseAuth.instance.currentUser!.email!
                                    .split('@'),
                                context,
                              );
                            },
                            icon: const Icon(Icons.send))
                      ],
                    ),
                  ),
                );
              },
            );
          },
          backgroundColor: ColorConstant.black,
          child: const Icon(Icons.add),
        );
      }),
    );
  }
}
