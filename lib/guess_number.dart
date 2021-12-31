import 'dart:io';
import 'dart:math';

import 'package:honework_guess_number3/game.dart';
var game ;
void main() {

  while(true) {
    playGame();
    String? input;

    do {
      stdout.write('Play again? (Y/N) : ');
      input = stdin.readLineSync();
    } while (input!.toLowerCase() != 'y' && input.toLowerCase() != 'n');

    if (input.toLowerCase() == 'n') {
        game.printInfo();
      break;
    }
  }
}



void playGame() {
  stdout.write('Enter a maximum number to random: ');
  var x = stdin.readLineSync()  ;
  var n = int?.tryParse(x!);

  if(n==null)
    game = Game();
  else
    game = Game(maxRandom: n);

  var isCorrect = false;

  print('╔════════════════════════════════════════');
  print('║            GUESS THE NUMBER            ');
  print('╟────────────────────────────────────────');

  do {
    stdout.write('║ Guess the number between 1 and ${game.x} : ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);

    if (guess == null) {
      continue;
    }

    var result = game.doGuess(guess);

    if (result == 1) {
      print('║ ➜ $guess is TOO HIGH! ▲');
      print('╟────────────────────────────────────────');
    } else if (result == -1) {
      print('║ ➜ $guess is TOO LOW! ▼');
      print('╟────────────────────────────────────────');
    } else if (result == 0) {
      print('║ ➜ $guess is CORRECT ❤, total guesses: ${game.guessCount}');
      print('╟────────────────────────────────────────');
      isCorrect = true;

    }
  } while (!isCorrect);

  print('║                 THE END                ');
  print('╚════════════════════════════════════════');
}