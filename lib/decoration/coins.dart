import 'package:bonfire/bonfire.dart';
import 'package:desafio2/decoration/decoration_sprite.dart';
import 'package:desafio2/player/pacman.dart';

class Coins extends GameDecoration with Sensor {
  Coins(Vector2 position)
      : super.withSprite(
          sprite: DecorationSprite.coin,
          position: position,
          size: Vector2(8, 8),
        ) {
    setupSensorArea(areaSensor: [
      CollisionArea.rectangle(
        size: Vector2(8, 8),
        //align: Vector2(6, 6),
      )
    ]);
  }

  @override
  void onContact(GameComponent component) {
    if (component is Pacman) {
      component.incrementScore(10);
      removeFromParent();
    }
  }

  @override
  void onContactExit(GameComponent component) {
    // TODO: implement onContactExit
  }
}
