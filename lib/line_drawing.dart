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
    return
        // Positioned(
        //   left: 0,
        //   top: 0,
        //   child:
        GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanUpdate: (details) {
        setState(() {
          if (color == Colors.red) {
            position = position + details.delta;
          }
        });
      },
      onTap: () {
        setState(() {
          if (color == Colors.red) {
            color = Colors.blue;
          } else {
            color = Colors.red;
          }
        });
      },
      // child: Container(
      //     // width: MediaQuery.of(context).size.width,
      //     // height: MediaQuery.of(context).size.height,
      //     color: Colors.grey,
      //     child: CustomPaint(
      //       foregroundPainter: LinePainter(color: color, position: position),
      //       // size: Size.infinite,
      //       size: Size(MediaQuery.of(context).size.width,
      //           MediaQuery.of(context).size.height),
      //     )),

      child: CustomPaint(
        foregroundPainter: LinePainter(color: color, position: position),
        // size: Size.infinite,
        // child: Container(
        //   color: Colors.green,
        //   width: 100,
        //   height: 100,
        // )
      ),
      // child: IgnorePointer(
      //     child: Container(
      //   // color: Colors.green,
      //   decoration: BoxDecoration(
      //     color: Colors.transparent,
      //     borderRadius: BorderRadius.circular(48),
      //   ),
      //   width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,
      // )),
      // ),
    );
    // );
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
    return true;
  }
}
