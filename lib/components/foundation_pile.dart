import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_flame/components/suit.dart';
import 'package:hello_flame/klondike_game.dart';

import 'card.dart';

class FoundationPile extends PositionComponent {
  final List<Card> _cards = [];
  final Suit suit;

  //paint objects
  final _borderPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..color = const Color(0x50ffffff);
  late final _suitPaint = Paint()
    ..color = suit.isRed ? const Color(0x3a000000) : const Color(0x64000000)
    ..blendMode = BlendMode.luminosity;

  FoundationPile(int intSuit, {super.position})
      : suit = Suit.fromInt(intSuit),
        super(size: KlondikeGame.cardSize);

  void acquireCard(Card card) {
    assert(card.isFaceUp);
    card.position = position;
    card.priority = _cards.length;
    _cards.add(card);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(KlondikeGame.cardRRect, _borderPaint);
    suit.sprite.render(
      canvas,
      position: size / 2,
      anchor: Anchor.center,
      size: Vector2.all(KlondikeGame.cardWidth * 0.6),
      overridePaint: _suitPaint,
    );
  }
}
