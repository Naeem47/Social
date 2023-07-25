import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social/widgets/like_button.dart';

class PostTemplate extends StatefulWidget {
  const PostTemplate(
      {super.key,
      required this.messege,
      required this.email,
      required this.likes,
      required this.postid});
  final String messege;
  final String email;
  final String postid;
  final List<String> likes;

  @override
  State<PostTemplate> createState() => _PostTemplateState();
}

class _PostTemplateState extends State<PostTemplate> {
  final ref = FirebaseAuth.instance.currentUser!;
  bool isliked = false;

  @override
  void initState() {
    super.initState();
    isliked = widget.likes.contains(ref.email);
  }

  tooglike() {
    setState(() {
      isliked = !isliked;
    });
    DocumentReference postref =
        FirebaseFirestore.instance.collection("Feed").doc(widget.postid);
    if (isliked) {
      postref.update({
        'Likes': FieldValue.arrayUnion([ref.email])
      });
    } else {
      postref.update({
        'Likes': FieldValue.arrayRemove([ref.email])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.black38),
padding: EdgeInsets.all(10),
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 20.0,
          // crossAxisAlignment: CrossAxisAlignment.,
          // spacing: 0.15,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.brown),
                    child: const Icon(Icons.person),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    widget.email,
                    style: GoogleFonts.urbanist(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.9),
                  child: Text(
                    // softWrap: true,
                   textDirection: TextDirection.ltr,
                       widget.messege,
                       // softWrap: true,
                       maxLines: 10,
                       overflow: TextOverflow.ellipsis,
                       style: GoogleFonts.urbanist(
                           fontSize: 20, fontWeight: FontWeight.w400),
                     ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(height: 1, color: Colors.brown),
            const SizedBox(
              height: 6,
            ),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Wrap(
                      children: [
                        LIKEBUTTON(ontap: tooglike, isliked: isliked),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          widget.likes.length.toString(),
                          style: GoogleFonts.urbanist(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const Icon(Icons.comment_rounded),
                    const Icon(Icons.share),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
