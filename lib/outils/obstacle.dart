import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyBarriere extends StatelessWidget {
  const MyBarriere({super.key, required this.barrierHeight, this.barrierWidth, this.barrierX, required this.isThisBottomBarrier});

  final barrierWidth;
  final barrierHeight;
  final barrierX;
  final bool isThisBottomBarrier;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * barrierX + barrierWidth) / (2 - barrierWidth), isThisBottomBarrier ? 1 : -1),
      child: Container(
        color: Colors.green,
        width: MediaQuery.of(context).size.width * barrierWidth / 2,
        height: MediaQuery.of(context).size.height * 3 / 4 * barrierHeight / 2,
      ),
    );
  }
}