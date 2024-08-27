import 'package:flutter/material.dart';
class DrawCircle extends StatefulWidget {
  const DrawCircle({super.key});

  @override
  State<DrawCircle> createState() => _DrawCircleState();
}

class _DrawCircleState extends State<DrawCircle> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: SizedBox.square(
        dimension: 200,
      ),
      painter: DemoPainter(),
    );
  }
}


class DemoPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    var center=size/2;
    Paint paint=Paint()..color.blue..strokeWidth=20;
    canvas.drawCircle(Offset(center.width, center.height), 60, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }

}