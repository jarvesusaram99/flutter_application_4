import 'package:flutter/material.dart';
import 'package:flutter_application_4/animated_icon.dart';
import 'package:flutter_application_4/animated_position.dart';
import 'package:flutter_application_4/animated_size.dart';
import 'package:flutter_application_4/animated_switcher.dart';
import 'package:flutter_application_4/drag_bottom_screen.dart';
import 'package:flutter_application_4/listview_screen.dart';
import 'package:flutter_application_4/physicalModelScreen.dart';
import 'package:flutter_application_4/timer_screen.dart';
import 'package:flutter_application_4/tween_animation.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
      ),
      appBar: AppBar(
        title: const Text('Welcome in Flutter session'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            FilterChip(
                label: const Text("List animation"),
                onSelected: (value) {
                  Get.to(() => const ListviewScreen());
                }),
            FilterChip(
                label: const Text("Animated Icon"),
                onSelected: (value) {
                  Get.to(() => const AnimatedIconScreen());
                }),
            FilterChip(
                label: const Text("Animated Switcher"),
                onSelected: (value) {
                  Get.to(() => const AnimatedSwitcherScreen());
                }),
            FilterChip(
                label: const Text("Animated Size"),
                onSelected: (value) {
                  Get.to(() => const AnimatedSizeScreen());
                }),
            FilterChip(
                label: const Text("Animated Textstyle"),
                onSelected: (value) {
                  Get.to(() => const AnimatedTextStyleScreen());
                }),
            FilterChip(
                label: const Text("Physical Model"),
                onSelected: (value) {
                  Get.to(() => const PhysicalModelScreen());
                }),
            FilterChip(
                label: const Text("Drag down to dismiss"),
                onSelected: (value) {
                  Get.to(() => FirstRoute());
                }),
            FilterChip(
                label: const Text("Timer"),
                onSelected: (value) {
                  Get.to(() => TimerScreen());
                }),
            FilterChip(
                label: const Text("Tween Animation"),
                onSelected: (value) {
                  Get.to(() => FlutterAnimations());
                }),
          ],
        ),
      ),
    );
  }
}
