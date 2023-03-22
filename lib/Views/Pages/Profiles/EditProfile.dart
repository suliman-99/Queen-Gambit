import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/Models/UserModel.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Components/Bottons/MyColorBotton.dart';
import 'package:flagfall/Views/Components/Others/MyAvatar.dart';
import 'package:flagfall/Views/Pages/HomePage/MyHomePage.dart';
import 'package:flagfall/Views/Pages/LogIn&SignUp/SignUpPage.dart';
import 'package:flagfall/Views/Pages/LogIn&SignUp/UsernameField.dart';
import 'package:flagfall/Views/Pages/Profiles/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class EditProfile extends StatefulWidget {
  int selected;
  String name;
  EditProfile(this.selected, this.name);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.47,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 80,
              child: ListView.builder(
                  itemCount: 15,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.selected = index + 1;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 70,
                          child: MyAvatar(index + 1),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 40,
            ),
            UsernameField(textEditingController, 'New Username'),
            MyColorBotton(
              () async {
                await Firebase.initializeApp();
                var temp = await FirebaseFirestore.instance
                    .collection('users')
                    .where('name', isEqualTo: widget.name)
                    .get();
                UserModel u = UserModel.fromMap(temp.docs.first.data());
                FirebaseAuth.instance.currentUser
                    .updateDisplayName(textEditingController.text);
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.name)
                    .delete();
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(textEditingController.text)
                    .set({
                  'name': textEditingController.text,
                  'rate': u.rate,
                  'avatar': widget.selected,
                  'gamePlayed': u.gamePlayed,
                  'winRate': u.winRate,
                  'loseRate': u.looseRate,
                  'friends': u.friends,
                });
                Get.off(MyHomePage());
              },
              Colors.purple[700],
              'Submit',
              50,
              150,
            ),
          ],
        ),
      ),
    );
  }
}
