import 'dart:ui';
import 'dart:math' as math;

class AppUtils {
// Randomize a color
  static getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1);
  }
}
