import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_flame/components/card.dart';
import 'package:hello_flame/klondike_game.dart';

class TableauPile extends PositionComponent {
  TableauPile({super.position}) : super(size: KlondikeGame.cardSize);

  final _borderPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..color = const Color(0x50ffffff);

  /// Which cards are currently placed onto this pile.
  final List<Card> _cards = [];
  final Vector2 _fanOffset = Vector2(0, KlondikeGame.cardHeight * 0.5);

  void acquireCard(Card card) {
    if (_cards.isEmpty) {
      card.position = position;
    } else {
      card.position = _cards.last.position + _fanOffset;
    }
    card.priority = _cards.length;
    _cards.add(card);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(KlondikeGame.cardRRect, _borderPaint);
  }

  void flipTopCard() {
    assert(_cards.last.isFaceDown);
    _cards.last.flip();
  }
}
