import 'package:ecommerce/constants/theme.dart';
import 'package:ecommerce/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:ecommerce/screens/auth_ui/welcome/welcome.dart';
import 'package:ecommerce/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      title: 'E Commerce',
      home: StreamBuilder(
        stream: FirebaseAuthHelper.instance.getAuthChange,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const Home();
          }
          else{
            return const Welcome();
          }
        },
      )
    );
  }
}
