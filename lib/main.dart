import 'package:flutter/material.dart';
import 'package:flutter_chart_playground/transformed_line_drawing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Paint Movement Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<Offset> _positions = [
  //   Offset.zero,
  //   Offset(100, 100),
  //   Offset(200, 200),
  // ];
  final List<Widget> _children = [
    Container(
      color: Colors.greenAccent,
      height: 1000,
      width: 1000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Custom Paint Movement Demo'),
    //   ),
    //   body: Center(
    //     child: Stack(
    //       children: List.generate(
    //         _positions.length,
    //         (index) => TransformedLineDrawing(
    //           position: _positions[index],
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    Offset position;

    return GestureDetector(
      onTapUp: (TapUpDetails details) {
        setState(() {
          position = details.localPosition;

          _children.add(
            TransformedLineDrawing(
              position: position,
            ),
            // Indicator(
            //   position: position,
            //   color: Colors.blue,
            // ),
          );
        });
      },
      child: Stack(
        children: _children,
      ),
    );
  }
}

// class MyCustomPaint extends StatefulWidget {
//   final Offset position;

//   MyCustomPaint({required this.position});

//   @override
//   _MyCustomPaintState createState() => _MyCustomPaintState();
// }

// class _MyCustomPaintState extends State<MyCustomPaint> {
//   late Offset _position;

//   @override
//   void initState() {
//     super.initState();
//     _position = widget.position;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanUpdate: (details) {
//         setState(() {
//           _position += details.delta;
//         });
//       },
//       child: Transform.translate(
//         offset: _position,
//         child: CustomPaint(
//           painter: LinePainter(_position),
//           size: const Size(double.infinity, double.infinity),
//         ),
//       ),
//     );
//   }
// }

// class LinePainter extends CustomPainter {
//   final Offset currentPos;

//   LinePainter(this.currentPos);

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 10;

//     Offset startPoint = Offset(0, 0 + 1000);
//     Offset endPoint = Offset(0, 0 - 1000);

//     canvas.drawLine(startPoint, endPoint, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }

//   @override
//   bool hitTest(Offset position) {
//     print('hitTest: $position');

//     return position.dx > 0 && position.dx < 10;
//   }
// }
