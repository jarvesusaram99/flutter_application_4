import 'package:flutter/material.dart';

class AnimatedSizeScreen extends StatefulWidget {
  const AnimatedSizeScreen({super.key});

  @override
  State<AnimatedSizeScreen> createState() => _AnimatedIconScreenState();
}

class _AnimatedIconScreenState extends State<AnimatedSizeScreen> {
  double _height = 80.0;
  double _width = 80.0;
  var _color = Colors.blue;
  bool _resized = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.change_circle),
      //   onPressed: () {
      //     // isPlaying = !isPlaying;
      //     // setState(() {});
      //   },
      // ),
      appBar: AppBar(
        title: const Text('Animated Size'),
      ),
      body: Center(
        child: AnimatedSize(
          curve: Curves.fastOutSlowIn,
          duration: const Duration(seconds: 1),
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (_resized) {
                  _resized = false;
                  _color = Colors.blue;
                  _height = 80.0;
                  _width = 80.0;
                } else {
                  _resized = true;
                  _color = Colors.blue;
                  _height = 320.0;
                  _width = 320.0;
                }
              });
            },
            child: Container(
              width: _width,
              height: _height,
              color: _color,
            ),
          ),
        ),
      ),
    );
  }
}
