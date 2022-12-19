import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int timerLeft = 5;

  void _startCount() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerLeft > 0) {
        setState(() {
          timerLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: timerLeft.isEven
                  ? Text(
                      timerLeft == 0 ? "Done" : timerLeft.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      key: UniqueKey(),
                    )
                  : Text(
                      timerLeft == 0 ? "Done" : timerLeft.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: CupertinoButton.filled(
              child: const Text('Button Daba'),
              onPressed: () {
                _startCount();
              },
            ),
          ),
        ],
      ),
    );
  }
}
