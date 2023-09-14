import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String title,subtitle;
  const TopTitle({super.key,required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style:const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
