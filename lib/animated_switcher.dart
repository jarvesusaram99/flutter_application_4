import 'package:flutter/material.dart';

class AnimatedSwitcherScreen extends StatefulWidget {
  const AnimatedSwitcherScreen({super.key});

  @override
  State<AnimatedSwitcherScreen> createState() => _AnimatedIconScreenState();
}

class _AnimatedIconScreenState extends State<AnimatedSwitcherScreen> {
  late AnimationController _animationController;
  bool isPlaying = false;
  bool isHide = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          isHide = !isHide;
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: const Text('Animated Switcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // The AnimatedSwitcher uses a FadeTransiton by default

            const SizedBox(
              height: 20,
            ),
            AnimatedSwitcher(
              // transitionBuilder: (Widget child, Animation<double> animation) {
              //   final offsetAnimation = Tween<Offset>(
              //           begin: const Offset(0.0, 0.0),
              //           end: const Offset(0.0, -1.0))
              //       .animate(animation);
              //   return ScaleTransition(
              //     scale: animation,
              //     child: child,
              //   );
              // },
              switchInCurve: Curves.bounceInOut,
              duration: const Duration(seconds: 1),
              child: isPlaying
                  ? Container(
                      key: UniqueKey(),
                      height: 200.0,
                      width: 100.0,
                      decoration: const BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    )
                  : Container(
                      key: UniqueKey(),
                      height: 200.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12)),
                    ),
            ),
            ElevatedButton(
                onPressed: () {
                  isPlaying = !isPlaying;
                  setState(() {});
                },
                child: const Text("Animated Me")),

            const SizedBox(
              height: 80,
            ),
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: !isHide
                  ? Container(
                      key: UniqueKey(),
                    )
                  : SizedBox(
                      key: UniqueKey(),
                      height: 200,
                      child: InkWell(
                        onTap: () {
                          isHide = !isHide;
                          setState(() {});
                        },
                        child: Image.network(
                            "https://w0.peakpx.com/wallpaper/242/618/HD-wallpaper-don-t-touch-me-text-inscription-objection-inspirational-quote-blue.jpg"),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
