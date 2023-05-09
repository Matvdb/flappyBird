class FlappyBird{
  
  static int score = 0;
  int ?_bestScore;
  String _joueur = "";

  FlappyBird(this._joueur, this._bestScore);

  int? getBestScore(){
    return this._bestScore;
  }

  String getJoueur1(){
    return this._joueur;
  }
}