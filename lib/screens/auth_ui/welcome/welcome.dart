import 'dart:ui';

import 'package:ecommerce/constants/routes.dart';
import 'package:ecommerce/screens/auth_ui/login/login.dart';
import 'package:ecommerce/screens/auth_ui/signup/signup.dart';
import 'package:ecommerce/widget/top_titles/top_titles.dart';
import 'package:flutter/material.dart';

import '../../../widget/wlecome_screen_button/welcome_screen_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

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
                const TopTitle(title: "Akshat Store", subtitle:"Buy any item from this store"),
                const SizedBox(height: 45,),
                WelcomeButton(title: "Login",onPressed: (){
                  Routes.instance.push(const Login(), context);
                },),
                const SizedBox(height: 18,),
                // WelcomeButton(title: "Signin",onPressed: (){},),
                WelcomeButton(title: "signin",onPressed: (){
                  Routes.instance.push(const Signin(), context);
                },)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
