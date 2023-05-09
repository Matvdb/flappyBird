import 'package:flappy_bird/ecran/game.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.rectangle,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: Image(image: AssetImage("assets/logo.png")),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.rectangle,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Game())),
        tooltip: 'Jouer',
        label: const Text("Jouer"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}