import 'package:bonfire/bonfire.dart';
import 'package:desafio2/ghosts/ghost_sprite.dart';

class Ghost extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement {
  bool canMove = true;
  bool movePath = false;
  bool _isVulnerable = false;
  bool get isVulnerable => _isVulnerable;
  Future<void>? vulnerableEnd;
  Ghost(Vector2 position)
      : super(
          position: position,
          size: Vector2(11, 11),
          speed: 20,
          animation: SimpleDirectionAnimation(
            idleLeft: GhostSprite.ghostIdleLeft,
            runLeft: GhostSprite.ghostRunLeftt,
            idleRight: GhostSprite.ghostIdleRight,
            runRight: GhostSprite.ghostRunRight,
            idleUp: GhostSprite.ghostIdleUp,
            runUp: GhostSprite.ghostRunUp,
            idleDown: GhostSprite.ghostIdleDown,
            runDown: GhostSprite.ghostRunDown,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(size: Vector2(10, 10)),
        ],
      ),
    );
  }

  void randomMoviment(double dt) {
    runRandomMovement(
      dt,
      minDistance: 50,
      maxDistance: 200,
      speed: speed,
      timeKeepStopped: 0,
    );
  }

  void vulnerable() async {
    _isVulnerable = true;
    animation!.idleLeft = await GhostSprite.ghostVulnerable;
    animation!.runLeft = await GhostSprite.ghostVulnerable;
    animation!.idleRight = await GhostSprite.ghostVulnerable;
    animation!.runRight = await GhostSprite.ghostVulnerable;
    animation!.idleUp = await GhostSprite.ghostVulnerable;
    animation!.runUp = await GhostSprite.ghostVulnerable;
    animation!.idleDown = await GhostSprite.ghostVulnerable;
    animation!.runDown = await GhostSprite.ghostVulnerable;

    vulnerableEnd = Future.delayed(const Duration(seconds: 5), () async {
      animation!.idleLeft = await GhostSprite.ghostEndVulnerable;
      animation!.runLeft = await GhostSprite.ghostEndVulnerable;
      animation!.idleRight = await GhostSprite.ghostEndVulnerable;
      animation!.runRight = await GhostSprite.ghostEndVulnerable;
      animation!.idleUp = await GhostSprite.ghostEndVulnerable;
      animation!.runUp = await GhostSprite.ghostEndVulnerable;
      animation!.idleDown = await GhostSprite.ghostEndVulnerable;
      animation!.runDown = await GhostSprite.ghostEndVulnerable;

      Future.delayed(const Duration(seconds: 5), () async {
        animation!.idleLeft = await GhostSprite.ghostIdleLeft;
        animation!.runLeft = await GhostSprite.ghostRunLeftt;
        animation!.idleRight = await GhostSprite.ghostIdleRight;
        animation!.runRight = await GhostSprite.ghostRunRight;
        animation!.idleUp = await GhostSprite.ghostIdleUp;
        animation!.runUp = await GhostSprite.ghostRunUp;
        animation!.idleDown = await GhostSprite.ghostIdleDown;
        animation!.runDown = await GhostSprite.ghostRunDown;
        _isVulnerable = false;
      });
    });
  }

  @override
  bool onCollision(GameComponent component, bool active) {
    if (component is Ghost) return false;
    // if (component is Pacman && !_isVulnerable) {
    //   component.die();
    // }else{

    // }

    return super.onCollision(component, active);
  }

  @override
  void update(double dt) {
    if (!canMove) return;
    if (_isVulnerable) {
      positionsItselfAndKeepDistance(gameRef.player!,
          positioned: (p0) => randomMoviment(dt),
          radiusVision: 512,
          minDistanceFromPlayer: 256);
    } else {
      seeAndMoveToPlayer(
          closePlayer: (p0) {
            simpleAttackMelee(damage: 100, size: Vector2(0, 0));
          },
          radiusVision: 64,
          margin: -1,
          notObserved: () => randomMoviment(dt));
    }

    super.update(dt);
  }
}



//cada objeto vai ser um
