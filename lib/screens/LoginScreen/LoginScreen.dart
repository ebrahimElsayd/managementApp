import 'package:flutter/material.dart';
import 'package:managementapp/layout/homeLayout.dart';
import 'package:managementapp/screens/HomeScreen/HomeScreen.dart';

import 'package:managementapp/screens/LoginScreen/validationUtilities.dart';
import 'package:managementapp/screens/TextFormFeild.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "loginScreen";

  LoginScreen({super.key});

  TextEditingController email =
      TextEditingController(text: 'ebrahim@route.com');

  TextEditingController password = TextEditingController(text: '123456');

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/loginBg.png",
            ),
            fit: BoxFit.fill,
          )),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 50),
          child: Form(
            key: formKey,
            child: Column(
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 100),
                    //  alignment: Alignment(100, 200),
                    child: const Image(
                        image: AssetImage("assets/images/lockImg.png")),
                  ),
                ),
                const Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 55,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                  width: 40,
                ),
                CustomFormField(
                  icons: Icons.email,
                  hint: "email",
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please enter right email";
                    }
                    if (!IsValidEmail(text)) {
                      return "email is bad format";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFormField(
                  hint: "password",
                  icons: Icons.lock,
                  secureText: true,
                  keyboardType: TextInputType.text,
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return "please enter password";
                    }
                    if (text.length < 6) {
                      return null;
                    }
                    return null;
                  },
                  controller: password,
                ),
                const SizedBox(
                  height: 60,
                  width: 70,
                ),
                SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      )),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print(email);
                      }

                      Navigator.of(context).pushNamed(HomeScreen.routeName);
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
