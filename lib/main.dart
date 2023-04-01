import 'package:flutter/material.dart';
import 'package:flutter_chart_playground/indicator.dart';
import 'package:flutter_chart_playground/line_drawing.dart';

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
          child: AddContainerToStack(),
        ),
      ),
    );
  }
}

class AddContainerToStack extends StatefulWidget {
  @override
  _AddContainerToStackState createState() => _AddContainerToStackState();
}

class _AddContainerToStackState extends State<AddContainerToStack> {
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
            LineDrawing(
              position: position,
              color: Colors.lightBlue,
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
