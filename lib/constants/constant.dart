// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.amber,
      textColor: Colors.black,
      fontSize: 16.0);
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(builder: (context) {
      return SizedBox(
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(
              color: Color(0xff23d48e),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading..."),
            )
          ],
        ),
      );
    }),
  );
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext) {
        return alert;
      });
}

String getMessageFromErrorCode(String errorcode){
  switch (errorcode) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return "Email already used go to login page.";
    case "account-exists-with-different-credential":
      return "Email already used go to login page.";
    case "email-already-in-use":
      return "Email already used go to login page.";
    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong password";
    case "ERROR_USER_NOT_FOUND":
      return "No user found with this email";
    case "user-not-found":
      return "No user found with this email";
    case "ERROR_USER_DISABLED":
      return "User disabled";
    case "user-disabled":
      return "User disabled";
    case "ERROR_TOO_MANY_REQUEST":
      return "Too many request to log into this account";
    case "operation-not-allowed":
      return "Too many request to log into this account";
    case "ERROR_OPERATION_NOT_ALLOWED":
      return "Too many request to log into this account";
    case "ERROR_INVALID_EMAIL":
      return "Email address invalid";
    case "invalid-email":
      return "Email address is invalid";
    default:
      return "Login failed. Please try again";
  }
}

bool loginValidation(String email,String password){
  if(email.isEmpty && password.isEmpty){
    showMessage("Both are empty");
    return false;
  }
  else if(email.isEmpty){
    showMessage("Email is empty");
    return false;
  }
  else if(password.isEmpty){
    showMessage("Password is empty");
    return false;
  }
  else{
    return true;
  }
}

bool signUnValidation(String email,String password,String name, String phone){
  if(email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty){
    showMessage("All feilds are empty are empty");
    return false;
  }
  else if(phone.isEmpty){
    showMessage("Email is empty");
    return false;
  }
  else if(name.isEmpty){
    showMessage("Email is empty");
    return false;
  }
  else if(email.isEmpty){
    showMessage("Email is empty");
    return false;
  }
  else if(password.isEmpty){
    showMessage("Password is empty");
    return false;
  }
  else{
    return true;
  }
}