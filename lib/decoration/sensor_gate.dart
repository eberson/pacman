import 'package:bonfire/bonfire.dart';
import 'package:pacman/util/game.dart';

enum DirectionGate { left, right }

class SensorGate extends GameDecoration with Sensor {
  bool canMove = true;
  final DirectionGate direction;

  SensorGate({required super.position, this.direction = DirectionGate.left})
      : super(
          size: Vector2.all(Game.tileSize),
        );

  @override
  void onContact(GameComponent component) {
    if (canMove) {
      canMove = false;

      switch(direction) {
        case DirectionGate.left:
          component.position = component.position.copyWith(
            x: 18 * Game.tileSize,
          );

          break;
        case DirectionGate.right:
          component.position = component.position.copyWith(
            x: 0,
          );

          break;
      }
    }
  }

  @override
  void onContactExit(GameComponent component) {
    canMove = true;
  }
}
