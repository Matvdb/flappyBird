import 'package:flappy_bird/ecran/game.dart';
import 'package:flappy_bird/outils/flappy_bird.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String _valeurSaisie = "";


  void _afficheStartGame(){
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.orange.shade100,
          title: Column(
            children: [
              Center(
                child: Text("Bienvenue dans " + widget.title, textAlign: TextAlign.center,),
              ),
              Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextFormField(
                          decoration: const InputDecoration(labelText:"Pseudo"),
                          validator: (valeur) {
                            if (valeur == null || valeur.isEmpty) {
                              return 'Veuillez saisir un pseudonyme';
                            } else {
                              _valeurSaisie = valeur.toString();
                              FlappyBird.joueur = _valeurSaisie;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text("Fermer")
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Game())); 
                }
              },
              child: const Text("Jouer")
            ),
          ],
        );
      }
    );
  }

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
        onPressed: () => setState(() {
          _afficheStartGame();
        }),
        tooltip: 'Jouer',
        label: const Text("Jouer"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}