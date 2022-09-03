import 'package:bonfire/bonfire.dart';
import 'package:desafio2/player/pacman.dart';
import 'package:flutter/material.dart';
import 'dart:async' as async;
import 'dart:ui' as dart_ui;

class InterfaceGame extends StatefulWidget {
  final BonfireGame game;
  static const String overlayKey = "game_interface";
  const InterfaceGame({Key? key, required this.game}) : super(key: key);

  @override
  State<InterfaceGame> createState() => _InterfaceGameState();
}

class _InterfaceGameState extends State<InterfaceGame> {
  int _playerLife = 0;
  int _playerScore = 0;
  late async.Timer _checkPlayerLifeTimer;
  late async.Timer _checkPlayerScoreTimer;
  dart_ui.Image? spritesheet;
  dart_ui.Image? gameOver;

  @override
  void initState() {
    Pacman player = (widget.game.player as Pacman);
    _playerLife = player.countLife;
    _playerScore = player.score;

    Flame.images.load("decorations/lifecounter.png").then((value) {
      spritesheet = value;
      setState(() {});
    });

    Flame.images.load("decorations/gameOver.png").then((value) {
      gameOver = value;
      setState(() {});
    });

    Future.delayed(const Duration(seconds: 3), () {
      _checkPlayerLifeTimer =
          async.Timer.periodic(const Duration(seconds: 1), (timer) {
        if ((widget.game.player as Pacman).countLife < _playerLife) {
          _playerLife = (widget.game.player as Pacman).countLife;
          setState(() {});
        }
      });

      _checkPlayerScoreTimer =
          async.Timer.periodic(const Duration(milliseconds: 50), (timer) {
        if ((widget.game.player as Pacman).score != _playerScore) {
          _playerScore = (widget.game.player as Pacman).score;
          setState(() {});
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _checkPlayerScoreTimer.cancel();
    _checkPlayerLifeTimer.cancel();
    super.dispose();
  }

  Widget _scoreWidget() {
    return (_playerLife <= 0)
        ? SpriteWidget(
            sprite: Sprite(
              gameOver!,
              srcPosition: Vector2(0, 0),
              srcSize: Vector2(96, 32),
            ),
          )
        : Text(
            'Score: ${_playerScore.toString()}',
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              backgroundColor: Colors.black,
              decoration: TextDecoration.none,
            ),
          );
  }

  Widget _countLifeWidget() {
    return (_playerLife < 1 || spritesheet == null)
        ? const SizedBox(width: 0)
        : Row(
            children: List<SpriteWidget>.generate(_playerLife, (index) {
            return SpriteWidget(
              sprite: Sprite(spritesheet!,
                  srcPosition: Vector2(0, 0), srcSize: Vector2(16, 16)),
            );
          }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _scoreWidget(),
          _countLifeWidget(),
        ],
      ),
    );
  }
}
