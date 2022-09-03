import 'package:bonfire/bonfire.dart';

class PacmanSprite {
  static Future<SpriteAnimation> imageSequence(
      {required String img,
      required Vector2 position,
      required int amount,
      double temp = 0.15}) {
    return SpriteAnimation.load(
      'person/pacman/$img',
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: temp,
        textureSize: Vector2(32, 32),
        texturePosition: position,
      ),
    );
  }

  static Future<SpriteAnimation> get pacmanIdleLeft =>
      imageSequence(img: 'left.png', amount: 1, position: Vector2(0, 0));

  static Future<SpriteAnimation> get pacmanRunLeftt =>
      imageSequence(img: 'left.png', amount: 2, position: Vector2(0, 0));

  static Future<SpriteAnimation> get pacmanIdleRight =>
      imageSequence(img: 'right.png', amount: 1, position: Vector2(32, 0));

  static Future<SpriteAnimation> get pacmanRunRight =>
      imageSequence(img: 'right.png', amount: 2, position: Vector2(0, 0));

  static Future<SpriteAnimation> get pacmanIdleDown =>
      imageSequence(img: 'down.png', amount: 1, position: Vector2(32, 0));

  static Future<SpriteAnimation> get pacmanRunDown =>
      imageSequence(img: 'down.png', amount: 2, position: Vector2(0, 0));

  static Future<SpriteAnimation> get pacmanIdleUp =>
      imageSequence(img: 'up.png', amount: 1, position: Vector2(32, 0));

  static Future<SpriteAnimation> get pacmanRunrunUp =>
      imageSequence(img: 'up.png', amount: 2, position: Vector2(0, 0));

  static Future<SpriteAnimation> get pacmanDie => imageSequence(
        img: 'die.png',
        amount: 11,
        temp: 0.15,
        position: Vector2(32, 0),
      );
}
