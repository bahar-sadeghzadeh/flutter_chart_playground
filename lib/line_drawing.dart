import 'package:flutter/material.dart';

class LineDrawing extends StatefulWidget {
  const LineDrawing({super.key, required this.position, required this.color});

  final Offset position;
  final Color color;

  @override
  State<LineDrawing> createState() => _LineDrawingState();
}

class _LineDrawingState extends State<LineDrawing> {
  Offset position = const Offset(0, 0);
  Color color = Colors.lightBlue;

  bool _isDrawing = false;
  List<Offset> _points = <Offset>[];

  @override
  void initState() {
    super.initState();

    position = widget.position;
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        setState(() {
          _isDrawing = true;
          _points = <Offset>[details.localPosition];
        });
      },
      onPanUpdate: (details) {
        setState(() {
          // if (color == Colors.red) {
          position = position + details.delta;
          // }
          // _points.add(details.localPosition);
          //     x += details.delta.dx;
          // y += details.delta.dy;
        });
      },
      onPanEnd: (details) {
        setState(() {
          _isDrawing = false;
        });
      },
      // onTap: () {
      //   setState(() {
      //     debugPrint('onPaint');
      //     if (color == Colors.red) {
      //       color = Colors.lightBlue;
      //     } else {
      //       color = Colors.red;
      //     }
      //   });
      // },
      child: CustomPaint(
        painter: LinePainter(
          position: position,
          color: color,
        ),
        child: Container(),
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  const LinePainter({required this.position, required this.color});

  final Offset position;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 10;

    Offset startPoint = Offset(position.dx, position.dy + 1000);
    Offset endPoint = Offset(position.dx, position.dy - 1000);

    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
