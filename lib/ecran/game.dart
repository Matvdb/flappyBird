import 'dart:async';
import 'package:flappy_bird/ecran/myhomepage.dart';
import 'package:flappy_bird/outils/bird.dart';
import 'package:flappy_bird/outils/flappy_bird.dart';
import 'package:flappy_bird/outils/obstacle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  // var bird
  static double birdY = 0;
  double time = 0;
  double height = 0;
  double gravity = -4.9;
  double velocity = 3;
  double birdWidth = 0.1;
  double birdHeight = 0.1;
  bool gameStarted = false;
  int score = 0;
  int bestScore = 0;
  double initialPosition = birdY;

  static List<double> barrierX = [2, 2 + 1.5];
  static double obstacleWidth = 0.5;
  List<List<double>> obstacleHeight = [
    [0.6, 0.4],
    [0.4, 0.6],
  ];

  void jump(){
    setState(() {
      time = 0;
      initialPosition = birdY;
    });
  }

  bool gameOver(){
    if(birdY < -1 || birdY > 1){
      return true;
    }

    for(int i = 0; i < barrierX.length; i++){
      if(barrierX[i] <= birdWidth && barrierX[i] + obstacleWidth >= -birdWidth && (birdY <= -1 + obstacleHeight[i][0] || birdY + birdHeight >= 1 - obstacleHeight [i][1])){
        return true;
      }
    }

    return false;
  }

  void startGame(){
    gameStarted = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      time += 0.01;
      height = gravity * time * time + velocity * time;

      setState(() {
        birdY = initialPosition - height;
      });

      if(gameOver()){
        timer.cancel();
        gameStarted = false;
        _showDialog();
      }
      moveMap();
    });
  }

  void moveMap(){
    for(int i = 0; i < barrierX.length; i ++){
      setState(() {
        barrierX[i] -= 0.005;
      });
      
      if(barrierX[i] < -1.5){
        barrierX[i] += 3;
      }
    }
  }

  void resetGame(){
    Navigator.pop(context);
    setState(() {
      birdY = 0;
      gameStarted = false;
      time = 0;
      initialPosition = birdY;
    });
  }

  void _showDialog(){
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.brown,
          title: Center(
            child: Text("Game Over"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage())), 
              child: Text("Quitter")
            ),
            TextButton(
              onPressed: () => resetGame(), 
              child: Text("Rejouer")
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(gameStarted){
            jump();
          } else {
            startGame();
          }
        });
      },
      child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.blue,
                child: Stack(
                  children: [
                    MyBird(
                      birdY: birdY,
                      birdWidth: birdWidth,
                      birdHeight: birdHeight,
                    ),
                    Container(
                      alignment: Alignment(0, -0.5),
                      child: gameStarted ? Text("") : Text("PRESS BUTTON TO PLAY", 
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontSize: 25.0
                        ),
                      ),
                    ),
                    MyBarriere(
                      barrierX: barrierX[0],
                      barrierWidth: obstacleWidth,
                      barrierHeight: obstacleHeight[0][0], 
                      isThisBottomBarrier: false,
                    ),
                    MyBarriere(
                      barrierX: barrierX[0],
                      barrierWidth: obstacleWidth,
                      barrierHeight: obstacleHeight[0][1], 
                      isThisBottomBarrier: true,
                    ),
                    MyBarriere(
                      barrierX: barrierX[1],
                      barrierWidth: obstacleWidth,
                      barrierHeight: obstacleHeight[1][0], 
                      isThisBottomBarrier: false,
                    ),
                    MyBarriere(
                      barrierX: barrierX[1],
                      barrierWidth: obstacleWidth,
                      barrierHeight: obstacleHeight[1][1], 
                      isThisBottomBarrier: true,
                    ),
                  ],
                ),
              )
            ),
            Container(
              height: 15,
              color: Colors.green,
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Score", style: TextStyle(
                          fontSize: 18.0,
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontWeight: FontWeight.normal
                        ),),
                        Padding(padding: EdgeInsets.all(15)),
                        Text(score.toString(), style: TextStyle(
                          fontSize: 18.0,
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontWeight: FontWeight.normal
                        ),),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Best Score", style: TextStyle(
                          fontSize: 18.0,
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontWeight: FontWeight.normal
                        ),),
                        Padding(padding: EdgeInsets.all(15)),
                        Text(bestScore.toString(),
                          style: TextStyle(
                          fontSize: 18.0,
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontWeight: FontWeight.normal
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
      ),
    );
  }
}