import 'dart:math';

class Game{
  int? _answer;
  var guessCount = 0;
  var x;
  static List<int> myList = [];

  Game({int maxRandom = 100}){
    x = maxRandom;
    var r = Random();
    _answer = r.nextInt(maxRandom)+1;
    // print(_answer);

  }

  int doGuess(int num){
    guessCount++;
    if(num == _answer){
      myList.add(guessCount);

      return 0;
    }else if(num < _answer!){
      return -1;
    }else{
      return 1;
    }
  }

  void printInfo(){
    print("");
    print("");
    print("You've played ${myList.length} games");
    for(int i = 0;i<myList.length;i++){
      print("🚀 Game #${i+1}: ${myList[i]} guesses");
    }
  }

}