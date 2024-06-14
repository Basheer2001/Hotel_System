import 'package:flutter/cupertino.dart';

class CircularAppBarShape extends ContinuousRectangleBorder {
  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    Path path = Path();
    path.moveTo(rect.left, rect.top);
    path.lineTo(rect.right, rect.top);
    path.lineTo(rect.right, rect.bottom + 30); // Adjust curvature depth
    path.quadraticBezierTo(rect.width / 2, rect.bottom + 40, rect.left, rect.bottom + 30); // Adjust curvature shape
    path.close();
    return path;
  }
}