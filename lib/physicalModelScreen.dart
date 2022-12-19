import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhysicalModelScreen extends StatefulWidget {
  const PhysicalModelScreen({super.key});

  @override
  State<PhysicalModelScreen> createState() => _AnimatedIconScreenState();
}

class _AnimatedIconScreenState extends State<PhysicalModelScreen> {
  bool _first = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Physical Model'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedPhysicalModel(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              elevation: _first ? 0 : 6.0,
              shape: BoxShape.circle,
              shadowColor: Colors.black,
              color: Colors.white,
              borderRadius: _first
                  ? const BorderRadius.all(Radius.circular(0))
                  : const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 120.0,
                width: 120.0,
                color: Colors.blue[50],
                child: const FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton.filled(
              child: const Text('Click Me!'),
              onPressed: () {
                setState(() {
                  _first = !_first;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
