import 'package:flutter/material.dart';

class TransformedLineDrawing extends StatefulWidget {
  const TransformedLineDrawing({required this.position});

  final Offset position;
  // final Color color;

  @override
  State<TransformedLineDrawing> createState() => _TransformedLineDrawingState();
}

class _TransformedLineDrawingState extends State<TransformedLineDrawing> {
  late Offset _position;
  // Color color = Colors.lightBlue;

  // bool _isDrawing = false;
  // List<Offset> _points = <Offset>[];

  @override
  void initState() {
    super.initState();

    _position = widget.position;

    // position = widget.position;
    // color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onPanUpdate: (details) {
    //     setState(() {
    //       // position += details.delta;
    //       _position += details.delta;
    //     });
    //   },
    //   // child: Transform.translate(
    //   //   offset: position,
    //   child: CustomPaint(
    //     painter: LinePainter(color: color, position: position),
    //     size: const Size(double.infinity, double.infinity),
    //   ),
    //   // ),
    // );
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _position += details.delta;
        });
      },
      child: Transform.translate(
        offset: _position,
        child: CustomPaint(
          painter: LinePainter(_position),
          size: const Size(double.infinity, double.infinity),
        ),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  // LinePainter({required this.position});

  // final Offset position;
  // final Color color;

  final Offset currentPos;

  LinePainter(this.currentPos);

  @override
  void paint(Canvas canvas, Size size) {
    // Paint paint = Paint()
    //   // ..color = color
    //   ..strokeWidth = 100;

    // Offset startPoint = Offset(position.dx, position.dy + 1000);
    // Offset endPoint = Offset(position.dx, position.dy - 1000);

    // canvas.drawLine(startPoint, endPoint, paint);

    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 10;

    Offset startPoint = Offset(0, 0 + 1000);
    Offset endPoint = Offset(0, 0 - 1000);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool hitTest(Offset position) {
    // Offset startPoint = Offset(position.dx - 50, position.dy + 1000);
    // Offset endPoint = Offset(position.dx + 50, position.dy - 1000);

    // // Check if the position is inside the circle

    // print(startPoint.dx <= position.dx &&
    //     position.dx <= endPoint.dx &&
    //     startPoint.dy <= position.dy &&
    //     position.dy <= endPoint.dy);

    // return true;
    return position.dx > 0 && position.dx < 10;
  }
}
