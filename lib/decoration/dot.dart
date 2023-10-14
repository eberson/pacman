import 'package:bonfire/bonfire.dart';
import 'package:pacman/util/common_sprite_sheet.dart';

class Dot extends GameDecoration {
  bool eaten = false;

  Dot({required super.position})
      : super.withSprite(
          sprite: CommonSpriteSheet.dot,
          size: Vector2.all(12),
        );

  @override
  Future<void> onLoad() {
    add(RectangleHitbox(size: size));
    return super.onLoad();
  }

  @override
  int get priority => LayerPriority.MAP + 1;
}
