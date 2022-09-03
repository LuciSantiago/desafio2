import 'package:bonfire/bonfire.dart';
import 'package:desafio2/ghosts/ghost.dart';
import 'package:desafio2/player/pacman_sprite.dart';

class Pacman extends SimplePlayer with ObjectCollision {
  bool isPacmanDead = false;
  bool canMove = true;

  int _score = 0;
  int get score => _score;
  int countLife = 3;

  Ghost? ghostToEat;

  Pacman(Vector2 posicao)
      : super(
          position: posicao,
          size: Vector2(16, 16),
          animation: SimpleDirectionAnimation(
              idleRight: PacmanSprite.pacmanIdleRight,
              runRight: PacmanSprite.pacmanRunRight,
              idleDown: PacmanSprite.pacmanIdleDown,
              runDown: PacmanSprite.pacmanRunDown,
              idleUp: PacmanSprite.pacmanIdleUp,
              runUp: PacmanSprite.pacmanRunrunUp,
              others: {'die': PacmanSprite.pacmanDie}),
          speed: 40,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(6, 6),
            align: Vector2(4, 4),
          ),
        ],
      ),
    );
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is Ghost && canMove) {
      if (component.isVulnerable) {
        canMove = false;
        ghostToEat = component;
        incrementScore(200);
      } else {
        canMove = false;
        die();
      }
    }
    return super.onCollision(component, active);
  }

  @override
  void die() async {
    canMove = false;
    isVisible = false;

    final dieAnimation = await PacmanSprite.pacmanDie;
    await animation?.playOnce(dieAnimation, onFinish: () {
      countLife--;
      animation?.opacity = 0;
      idle();

      isPacmanDead = true;
    });
    super.die();
  }

  void incrementScore(int score) {
    _score += score;
  }
}
