// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:ecommerce/constants/constant.dart';
import 'package:ecommerce/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommerce/screens/home/home.dart';
import 'package:ecommerce/widget/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/routes.dart';
import '../signup/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/login_background.jpg"),
                fit: BoxFit.cover),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(
                //   height: kToolbarHeight,
                // ),
                const TopTitle(
                    title: "Login",
                    subtitle: "Welcome back to our E commerce app"),
                const SizedBox(
                  height: 35,
                ),
                SizedBox(
                  width: 340,
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.5),
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.grey.shade600,
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  width: 340,
                  child: TextFormField(
                    controller: password,
                    obscureText: isShowPassword,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.5),
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outlined,
                          color: Colors.grey.shade600,
                        ),
                        suffixIcon: CupertinoButton(
                          onPressed: () {
                            setState(() {
                              isShowPassword = !isShowPassword;
                            });
                          },
                          padding: EdgeInsets.zero,
                          child: Icon(
                            Icons.visibility,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey.shade600),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                SizedBox(
                  height: 50,
                  width: 340,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool isvalidate = loginValidation(email.text , password.text);
                      print(isvalidate);
                      if(isvalidate == true){
                        bool islogined = await FirebaseAuthHelper.instance.login(email.text, password.text, context);
                        if(islogined == true){
                          Routes.instance.pushAndRemove(const Home(), context);
                        }
                      }
                    },
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                const Divider(
                  color: Colors.white,
                  indent: 20,
                  endIndent: 20,
                ),
                const Text(
                  "or login using",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {},
                      child: Image.asset(
                        "images/google_logo.png",
                        scale: 28.0,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have any account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: const Text(
                          "Sign up here",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xff23d48e),
                          ),
                        ),
                        onPressed: () {
                          Routes.instance.push(const Signin(), context);
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
