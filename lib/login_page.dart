import 'package:chat_app/chat_page.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Widgets/login_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();
  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passWordController.text);
      print("Login successful");

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');
    } else {
      print("not successful");
    }
  }

  final userNameController = TextEditingController();
  final passWordController = TextEditingController();
  final _mainUrl = 'https://github.com';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Let's sign you in!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpacing(20), // Add space between the texts if needed
                Text(
                  "Welcome back \nYou've been missed",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                Image.asset(
                  'assets/illustration.jpg',
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      LoginTextField(
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length < 5) {
                            return 'Username must be longer than 5 characters';
                          } else if (value != null && value.isEmpty) {
                            return 'please enter your username';
                          }
                        },
                        controller: userNameController,
                        hintText: 'Username',
                      ),
                      verticalSpacing(20),
                      LoginTextField(
                        controller: passWordController,
                        validator: (String? value) {},
                        hintText: 'Enter Your password',
                        hasAsterisks: true,
                      ),
                    ],
                  ),
                ),
              verticalSpacing(20),
                //Buttons
                ElevatedButton(
                    onPressed: () {
                      loginUser(context);
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),

                // OutlinedButton(onPressed: (){}, child: FlutterLogo()),
                GestureDetector(
                  onDoubleTap: () {
                    print("Double pressed");
                  },
                  onLongPress: () {
                    print("Long pressed");
                  },
                  onTap: () async{
                    //TODO navigate to browser
                    print("Linked clicked");
                    if(!await launch(_mainUrl)){
                      throw 'Could not launch';
                    }
                  },
                  child: Column(
                    children: [
                      Text("Find us on"),
                      Text(_mainUrl),
                    ],
                  ),
                ),
                // TODO add a social media library
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton.twitter(url: 'https://twitter.com',),
                    SocialMediaButton.linkedin(url: 'https://linkedin.com',)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
