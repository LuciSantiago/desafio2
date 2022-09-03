import 'package:bonfire/bonfire.dart';

class GhostSprite {
  static Future<SpriteAnimation> imageSequence(
      {required String img, required Vector2 position, required int amount}) {
    return SpriteAnimation.load(
      'person/ghost/$img',
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: 0.15,
        textureSize: Vector2(32, 32),
        texturePosition: position,
      ),
    );
  }

  static Future<SpriteAnimation> get ghostIdleLeft =>
      imageSequence(img: 'ghost.png', amount: 1, position: Vector2(128, 0));

  static Future<SpriteAnimation> get ghostRunLeftt =>
      imageSequence(img: 'ghost.png', amount: 2, position: Vector2(160, 0));

  static Future<SpriteAnimation> get ghostIdleRight =>
      imageSequence(img: 'ghost.png', amount: 1, position: Vector2(0, 0));

  static Future<SpriteAnimation> get ghostRunRight =>
      imageSequence(img: 'ghost.png', amount: 2, position: Vector2(32, 0));

  static Future<SpriteAnimation> get ghostIdleDown =>
      imageSequence(img: 'ghost.png', amount: 1, position: Vector2(64, 0));

  static Future<SpriteAnimation> get ghostRunDown =>
      imageSequence(img: 'ghost.png', amount: 2, position: Vector2(96, 0));

  static Future<SpriteAnimation> get ghostIdleUp =>
      imageSequence(img: 'ghost.png', amount: 1, position: Vector2(192, 0));

  static Future<SpriteAnimation> get ghostRunUp =>
      imageSequence(img: 'ghost.png', amount: 2, position: Vector2(192, 0));

  static Future<SpriteAnimation> get ghostVulnerable =>
      imageSequence(img: 'efeito.png', amount: 2, position: Vector2(0, 0));
  static Future<SpriteAnimation> get ghostEndVulnerable =>
      imageSequence(img: 'efeito.png', amount: 2, position: Vector2(64, 0));
}
