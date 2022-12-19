import 'package:flutter/material.dart';

class AnimatedIconScreen extends StatefulWidget {
  const AnimatedIconScreen({super.key});

  @override
  State<AnimatedIconScreen> createState() => _AnimatedIconScreenState();
}

class _AnimatedIconScreenState extends State<AnimatedIconScreen>
    with TickerProviderStateMixin {
  // VSYNC/TICKERPROVIDER ALLOWS ANIMATIONS TO BE MUTED, SLOWED, OR FAST-FORWARDED

  late AnimationController _animationController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        // vsync is the [TickerProvider] for the current context. It can be changed by calling [resync].
        // It is required and must not be null.
        vsync: this,
        duration: const Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Icon'),
      ),
      body: Center(
          child: IconButton(
        iconSize: 150,
        splashColor: Colors.greenAccent,
        icon: AnimatedIcon(
          icon: AnimatedIcons.pause_play,
          progress: _animationController,
        ),
        onPressed: () => _handleOnPressed(),
      )),
    );
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
    });
  }
}
