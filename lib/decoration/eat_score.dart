import 'package:bonfire/bonfire.dart';
import 'package:pacman/util/common_sprite_sheet.dart';
import 'package:pacman/util/game.dart';

class EatScore extends GameDecoration with Movement, HandleForces {
  EatScore({required super.position}) : super.withSprite(size: Vector2.all(Game.tileSize), sprite: CommonSpriteSheet.score100, renderAboveComponents: true) {
    speed = 140;
  }

  @override
  void update(double dt) {
    if (isStoped() && !isRemoving) {
      removeFromParent();
    }

    super.update(dt);
  }

  @override
  void onMount() {
    add(
      MoveByEffect(
        Vector2(0, -20),
        EffectController(duration: 1),
      ),
    );

    super.onMount();
  }
}
