import 'package:bonfire/bonfire.dart';

class DecorationSprite {
  static Future<Sprite> imageSequence(
      {required String img,
      required Vector2 position,
      required Vector2 tamanho}) {
    return Sprite.load(
      'decorations/$img',
      srcPosition: position,
      srcSize: tamanho,
    );
  }

  static Future<Sprite> get coin => imageSequence(
        tamanho: Vector2(32, 32),
        img: 'coins.png',
        position: Vector2(0, 0),
      );
  static Future<Sprite> get powerCoin => imageSequence(
        tamanho: Vector2(32, 32),
        img: 'coins.png',
        position: Vector2(0, 0),
      );
  static Future<Sprite> get pontsCoin => imageSequence(
        tamanho: Vector2(31, 18),
        img: 'score.png',
        position: Vector2(0, 0),
      );
}
