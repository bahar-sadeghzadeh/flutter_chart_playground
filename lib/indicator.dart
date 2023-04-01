import 'package:flutter/material.dart';

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
        child: Container(
          width: 10.0,
          height: 100.0,
          color: color,
        ),
      ),
    );
  }
}
