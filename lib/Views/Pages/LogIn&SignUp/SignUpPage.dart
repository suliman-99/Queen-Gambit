import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flagfall/Controllers/AuthController.dart';
import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/Models/UserModel.dart';
import 'package:flagfall/Providers/OfflineGameProvider.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Components/Others/Background.dart';
import 'package:flagfall/Views/Pages/HomePage/MyHomePage.dart';
import 'package:flagfall/Views/Pages/LogIn&SignUp/LogInPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'PasswordFeild.dart';
import 'SignInButton.dart';
import 'UsernameField.dart';

class SignUpPage extends StatelessWidget {
  final AuthController authController = AuthController();
  final TextEditingController emailc = TextEditingController();
  final TextEditingController usernamec = TextEditingController();
  final TextEditingController passwordc = TextEditingController();
  final TextEditingController confpasswordc = TextEditingController();
  final UserController userController = UserController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(
            image: 'assets\\images\\background.jpg',
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Log in',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 60,
                  ),
                ),
                Column(
                  children: [
                    MyText(text: 'Player email'),
                    UsernameField(emailc, 'Email'),
                    MyText(text: 'Player name'),
                    UsernameField(usernamec, 'Username'),
                    MyText(text: 'Player password'),
                    PasswordField(passwordc),
                    MyText(text: 'Confirm password'),
                    PasswordField(confpasswordc),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SignInButton(
                        text: 'Sign Up',
                        onPressed: () async {
                          if (confpasswordc.text != passwordc.text) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('invalid confirm password',
                                    textAlign: TextAlign.center)));
                          } else {
                            String response = await authController.signUp(
                                emailc.text, passwordc.text, usernamec.text);
                            if (response == 'success') {
                              await Firebase.initializeApp();
                              String name =
                                  FirebaseAuth.instance.currentUser.displayName;
                              UserController().setUser(UserModel(
                                name: usernamec.text,
                                rate: 0,
                                avatar: 0,
                                gamePlayed: 0,
                                winRate: 0,
                                looseRate: 0,
                                friends: [],
                              ));
                              UserViewModel u =
                                  await userController.getUserByName(name);
                              Provider.of<OfflineGameProvider>(
                                context,
                                listen: false,
                              ).updateUser(u);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                response,
                                textAlign: TextAlign.center,
                              )));
                              Get.off(MyHomePage());
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text(
                                response,
                                textAlign: TextAlign.center,
                              )));
                            }
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    SignInButton(
                      text: 'Log In',
                      onPressed: () {
                        Get.off(LogInPage());
                      },
                    ),
                  ],
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
          ),
        ],
      ),
    );
  }
}

class MyText extends StatelessWidget {
  final String text;
  const MyText({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 24,
      ),
    );
  }
}
