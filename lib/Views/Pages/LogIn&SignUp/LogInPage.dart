import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flagfall/Controllers/AuthController.dart';
import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/Providers/OfflineGameProvider.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flagfall/ViewModels/ThemeViewModel.dart';
import 'package:flagfall/Views/Components/Others/Background.dart';
import 'package:flagfall/Views/Pages/HomePage/MyHomePage.dart';
import 'package:flagfall/Views/Pages/LogIn&SignUp/SignUpPage.dart';
import 'package:provider/provider.dart';
import 'PasswordFeild.dart';
import 'UsernameField.dart';

class LogInPage extends StatelessWidget {
  final AuthController authController = AuthController();
  final TextEditingController usernamec = TextEditingController();
  final TextEditingController passwordc = TextEditingController();

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
                SizedBox(height: 30),
                Text(
                  'Log in',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 60,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      'Player name',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 24,
                      ),
                    ),
                    UsernameField(usernamec, 'Email'),
                    Text(
                      'Player password',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 24,
                      ),
                    ),
                    PasswordField(passwordc),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Center(
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MyColor(color: Colors.purple),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          String response = await authController.logIn(
                              usernamec.text, passwordc.text);

                          if (response == 'success') {
                            await Firebase.initializeApp();
                            String name =
                                FirebaseAuth.instance.currentUser.displayName;
                            UserViewModel u =
                                await UserController().getUserByName(name);
                            Provider.of<OfflineGameProvider>(
                              context,
                              listen: false,
                            ).updateUser(u);
                            Get.off(MyHomePage());
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              response,
                              textAlign: TextAlign.center,
                            )));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                              response,
                              textAlign: TextAlign.center,
                            )));
                          }
                          // Get.off(MyHomePage());
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    ElevatedButton(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.07,
                      ),
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          backgroundColor: MyColor(color: Colors.purple)),
                      onPressed: () {
                        Get.off(SignUpPage());
                      },
                    ),
                  ],
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ],
      ),
    );
  }
}
