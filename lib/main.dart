// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:math' as math;

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomImplicitAnimation(),
      ),
    );
  }
}

class CustomImplicitAnimation extends StatefulWidget {
  const CustomImplicitAnimation({super.key});

  @override
  _CustomImplicitAnimationState createState() =>
      _CustomImplicitAnimationState();
}

class _CustomImplicitAnimationState extends State<CustomImplicitAnimation> {
  double _angle = 0;
  double _currentValue = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TweenAnimationBuilder<double>(
            duration: const Duration(seconds: 2),
            tween: Tween(begin: 0, end: _angle),
            child: Container(
              height: 200,
              width: 300,
              color: Colors.black,
            ),
            builder: (_, angle, child) => Transform.rotate(
              angle: angle,
              child: child,
            ),
          ),
          Slider(
            value: _currentValue,
            onChanged: (value) {
              setState(() {
                _angle = value;
                _currentValue = value;
              });
            },
            max: math.pi * 2,
          ),
        ],
      ),
    );
  }
}
