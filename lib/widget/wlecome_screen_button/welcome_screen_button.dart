import 'package:flutter/material.dart';

class WelcomeButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const WelcomeButton({super.key,this.onPressed,required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
