import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyBird extends StatelessWidget {
  const MyBird({super.key, required this.birdHeight, required this.birdWidth, this.birdY});

  final birdY;
  final double birdWidth;
  final double birdHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, (2 * birdY + birdHeight) / (2 - birdHeight)),
      child: Image.asset(
        "assets/bird.png",
        height: MediaQuery.of(context).size.height * 3 / 4 * birdHeight / 2,
        width: MediaQuery.of(context).size.height * birdWidth / 2,
        fit: BoxFit.fill,
      )
      );
  }
}