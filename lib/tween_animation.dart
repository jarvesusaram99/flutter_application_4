import 'package:flutter/material.dart';

class FlutterAnimations extends StatefulWidget {
  @override
  _FlutterAnimationsState createState() => _FlutterAnimationsState();
}

class _FlutterAnimationsState extends State<FlutterAnimations>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<TextStyle> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 4000,
      ),
    );

    _animation = TextStyleTween(
      begin: const TextStyle(
        fontSize: 20.0,
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      end: const TextStyle(
        fontSize: 40.0,
        color: Colors.blue,
        fontWeight: FontWeight.w900,
      ),
    ).animate(_controller);

    _animation.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      body: InkWell(
        child: Center(
          child: Text(
            'Animations!',
            style: _animation.value,
          ),
        ),
      ),
    );
  }
}
