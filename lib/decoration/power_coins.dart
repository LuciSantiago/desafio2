import 'package:bonfire/bonfire.dart';
import 'package:desafio2/decoration/decoration_sprite.dart';
import 'package:desafio2/ghosts/ghost.dart';
import 'package:desafio2/player/pacman.dart';

class PowerCoins extends GameDecoration with Sensor {
  PowerCoins(Vector2 position)
      : super.withSprite(
            sprite: DecorationSprite.powerCoin,
            position: position,
            size: Vector2(16, 16));

  @override
  void onContact(GameComponent component) {
    if (component is Pacman) {
      removeFromParent();
      component.incrementScore(50);
      component.speed = 30;
      Future.delayed(const Duration(seconds: 10), () {
        component.speed = 40;
      });
      for (var enemy in gameRef.enemies()) {
        (enemy as Ghost).vulnerable();
      }
    }
  }

  @override
  void onContactExit(GameComponent component) {
    // TODO: implement onContactExit
  }
}
