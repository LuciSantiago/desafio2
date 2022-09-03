import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

// class Main extends StatefulWidget {
//   const Main({Key? key}) : super(key: key);

//   @override
//   State<Main> createState() => _MainState();
// }

// class _MainState extends State<Main> implements GameListener {
//   late GameController controller;
//   @override
//   void initState() {
//     controller = GameController()..addListener(this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 70),
//       child: BonfireWidget(
//         gameController: controller,
//         joystick: Joystick(
//           directional: JoystickDirectional(),
//         ),
//         cameraConfig: CameraConfig(
//           moveOnlyMapArea: true,
//           smoothCameraSpeed: 0,
//           smoothCameraEnabled: true,
//           zoom: 1.5,
//         ),
//         components: [
//           MyGameController(),
//         ],
//         map: WorldMapByTiled(
//           'map/mapa_neon.tmj',
//           objectsBuilder: {
//             'ghost': (properties) => Ghost(
//                   properties.position,
//                 ),
//             'coins': (properties) => Coins(properties.position),
//           },
//         ),
//         player: Pacman(Vector2(111, 208)),
//         showCollisionArea: false,
//       ),
//     );
//   }

//   @override
//   void changeCountLiveEnemies(int count) {}

//   @override
//   void updateGame() {}
// }
