import 'dart:developer';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:pacman/decoration/dot.dart';
import 'package:pacman/decoration/dot_power.dart';
import 'package:pacman/decoration/sensor_gate.dart';
import 'package:pacman/enemy/ghost.dart';
import 'package:pacman/player/pacman.dart';
import 'package:pacman/widgets/interface_game.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    log("kIsWeb: $kIsWeb");

    return SafeArea(
      child: Container(
        color: Colors.black,
        child: Center(
          child: BonfireWidget(
            map: WorldMapByTiled(
              'map.tmj',
              objectsBuilder: {
                'sensor_left': (properties) => SensorGate(
                      position: properties.position,
                      direction: DirectionGate.left,
                    ),
                'sensor_right': (properties) => SensorGate(
                  position: properties.position,
                  direction: DirectionGate.right,
                ),
                'dot': (properties) => Dot(position: properties.position),
                'dot_power': (properties) => DotPower(position: properties.position),
                'ghost_red': (properties) => Ghost(position: properties.position, type: GhostType.red),
                'ghost_pink': (properties) => Ghost(position: properties.position, type: GhostType.pink),
                'ghost_orange': (properties) => Ghost(position: properties.position, type: GhostType.orange),
                'ghost_blue': (properties) => Ghost(position: properties.position, type: GhostType.blue),
              },
            ),
            joystick: Joystick(
              keyboardConfig: KeyboardConfig(),
            ),
            overlayBuilderMap: {
              'score': (context, game) => const InterfaceGame(),
            },
            initialActiveOverlays: const [
              'score',
            ],
            cameraConfig: CameraConfig(
              moveOnlyMapArea: true,
              initialMapZoomFit: kIsWeb ? InitialMapZoomFitEnum.fitHeight : InitialMapZoomFitEnum.fitWidth,
            ),
            player: PacMan(position: PacMan.initialPosition),
          ),
        ),
      ),
    );
  }
}
