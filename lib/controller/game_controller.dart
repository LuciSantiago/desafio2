import 'package:bonfire/bonfire.dart';
import 'package:desafio2/ghosts/ghost.dart';
import 'package:desafio2/home_page.dart';
import 'package:desafio2/player/pacman.dart';
import 'package:flutter/material.dart';

class ControllerGame extends GameComponent {
  bool _gameOver = false;

  void _resetGame() {
    gameRef.player!.speed = 0;
    gameRef.enemies().forEach((element) {
      element.speed = 0;
    });
    gameRef.player?.removeFromParent();

    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return const HomePage();
      },
    ), (route) => false);
  }

  void _respaw() {
    gameRef.enemies().forEach((ghost) {
      ghost.speed = 0;
      (ghost as Ghost).canMove = false;
    });

    gameRef.enemies().forEach((enemy) {
      enemy.removeFromParent();
    });
    gameRef.addAll([
      HomePage.ghost,
      HomePage.ghost,
      HomePage.ghost,
      HomePage.ghost,
      HomePage.ghost,
      HomePage.ghost,
      HomePage.ghost,
      HomePage.ghost,
    ]);
    final player = (gameRef.player as Pacman);
    player.position = Vector2(102, 252.5);
    player.enableCollision(true);
    player.isPacmanDead = false;
    player.canMove = true;
    _gameOver = false;
  }

  @override
  void update(double dt) {
    if (checkInterval("game_over", 200, dt)) {
      Pacman pacman = (gameRef.player as Pacman);
      if (pacman.ghostToEat != null) {
        pacman.ghostToEat!.removeFromParent();
        pacman.ghostToEat = null;
        Future.delayed(
          const Duration(milliseconds: 500),
          () {
            HomePage.ghost;
            (gameRef.player as Pacman).canMove = true;
          },
        );
      }

      if (gameRef.decorations().isEmpty) {
        //gameRef.pauseEngine();
        Future.delayed(const Duration(seconds: 2), () {
          _resetGame();
        });
      }

      if (gameRef.player != null &&
          (gameRef.player as Pacman).isPacmanDead &&
          !_gameOver) {
        if (pacman.countLife <= 0) {
          _gameOver = true;
          //gameRef.pauseEngine();
          _resetGame();
        } else {
          _gameOver = true;
          _respaw();
        }
      }
    }
    super.update(dt);
  }
}
