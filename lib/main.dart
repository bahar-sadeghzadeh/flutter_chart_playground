import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: DraggableWidgetStack(),
        ),
      ),
    );
  }
}

class DraggableWidgetStack extends StatefulWidget {
  @override
  _DraggableWidgetStackState createState() => _DraggableWidgetStackState();
}

class _DraggableWidgetStackState extends State<DraggableWidgetStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
//       fit: StackFit.expand,
      children: <Widget>[
        Container(
          width: 1000.0,
          height: 1000.0,
          color: Colors.greenAccent,
        ),
        const Indicator(
          position: Offset(20, 100),
          color: Colors.blue,
        ),
        const Indicator(
          position: Offset(50.0, 100),
          color: Colors.blue,
        ),
      ],
    );
  }
}

class Indicator extends StatefulWidget {
  const Indicator({super.key, required this.position, required this.color});

  final Offset position;
  final Color color;

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  Offset position = const Offset(0, 0);
  Color color = Colors.blue;

  @override
  void initState() {
    super.initState();

    position = widget.position;
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            if (color == Colors.red) {
              position += details.delta;
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
        child: Container(
          width: 10.0,
          height: 100.0,
          color: color,
        ),
      ),
    );
  }
}
