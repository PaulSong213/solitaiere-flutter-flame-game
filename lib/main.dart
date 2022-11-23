import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_flame/klondike_game.dart';

void main() {
  final game = KlondikeGame();
  runApp(GameWidget(game: game));
}
