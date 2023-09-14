// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:ecommerce/constants/constant.dart';
import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/screens/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import '../../../widget/top_titles/top_titles.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isShowPassword = false;
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const SizedBox(
                    //   height: kToolbarHeight,
                    // ),
                    const TopTitle(
                        title: "Sign-In",
                        subtitle: "Welcome to our E commerce app"),
                    const SizedBox(
                      height: 35,
                    ),
                    SizedBox(
                      width: 340,
                      child: TextFormField(
                        controller: name,
                        keyboardType: TextInputType.name,
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
                              Icons.person,
                              color: Colors.grey.shade600,
                            ),
                            hintText: "Name",
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
                        controller: phone,
                        keyboardType: TextInputType.phone,
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
                              Icons.phone,
                              color: Colors.grey.shade600,
                            ),
                            hintText: "Phone",
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
                          bool isvalidate = signUnValidation(
                              email.text, password.text,name.text,phone.text);
                          print(isvalidate);
                          if (isvalidate == true) {
                            bool issignin = await FirebaseAuthHelper.instance
                                .signUp(email.text, password.text,
                                    context);
                            if (issignin == true) {
                              Routes.instance
                                  .pushAndRemove(const Home(), context);
                            }
                          }
                        },
                        child: const Text("Sign In"),
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
                      "or sign-in using",
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
                          "If you have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        CupertinoButton(
                            padding: EdgeInsets.zero,
                            child: const Text(
                              "Login here",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xff23d48e),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ],
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
