import 'package:bonfire/bonfire.dart';
import 'package:desafio2/controller/game_controller.dart';

import 'package:desafio2/decoration/coins.dart';
import 'package:desafio2/decoration/power_coins.dart';
import 'package:desafio2/ghosts/ghost.dart';
import 'package:desafio2/interface/interface.dart';

import 'package:desafio2/player/pacman.dart';
import 'package:flutter/material.dart';
import 'dart:async' as async_dart;

class HomePage extends StatefulWidget {
  static final Vector2 _ghostInicialPosition = Vector2(110, 138);
  static final Vector2 _playerInicialPosition = Vector2(102, 252.5);

  static Ghost get ghost => Ghost(_ghostInicialPosition);

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  async_dart.Timer? timer;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 70, left: 20),
      child: BonfireWidget(
        joystick: Joystick(
          keyboardConfig: KeyboardConfig(
              keyboardDirectionalType: KeyboardDirectionalType.arrows),
          directional: JoystickDirectional(),
        ),
        cameraConfig: CameraConfig(
            moveOnlyMapArea: true,
            smoothCameraSpeed: 0,
            smoothCameraEnabled: true,
            zoom: 1.5),
        components: [
          ControllerGame(),
        ],
        overlayBuilderMap: {
          InterfaceGame.overlayKey: (context, game) {
            return InterfaceGame(game: game);
          }
        },
        initialActiveOverlays: const [InterfaceGame.overlayKey],
        map: WorldMapByTiled(
          'map/mapa_neon.tmj',
          objectsBuilder: {
            'ghost': (properties) => Ghost(
                  properties.position,
                ),
            'coins': (properties) => Coins(properties.position),
            'power': (properties) => PowerCoins(properties.position)
          },
        ),
        player: Pacman(HomePage._playerInicialPosition),
        showCollisionArea: false,
      ),
    );
  }
}
