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
  final List<Widget> _children = [
    Container(
      color: Colors.greenAccent,
      height: 1000,
      width: 1000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Offset position;

    return GestureDetector(
      onTapUp: (TapUpDetails details) {
        setState(() {
          position = details.localPosition;

          _children.add(
            TransformedLineDrawing(
              position: position,
            ),
          );
        });
      },
      child: Stack(
        children: _children,
      ),
    );
  }
}
