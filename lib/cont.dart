import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  // int counter = 0;
  final key = GlobalKey<AnimatedListState>();
  TextEditingController textEditingController = TextEditingController();
  RxList<String> favoriteList = <String>[].obs;

  // Animated Icon

  Widget buildItem(
      int index, Animation<double> animation, BuildContext context) {
    return InkWell(
      onLongPress: () {
        removeItem(index);
      },

      // RotationTransition(
      // turn: animation,

      child: RotationTransition(
        // scale: animation,
        turns: animation,
        child: FilterChip(
          padding: const EdgeInsets.only(left: 10, right: 6, top: 8, bottom: 8),
          side: const BorderSide(
            color: Colors.white10,
          ),
          backgroundColor: Colors.grey.shade100,
          avatar: const Icon(Icons.history, size: 17, color: Colors.black),
          label: Text(
            favoriteList[index],
            style: const TextStyle(color: Colors.black),
          ),
          // selected: _filters.contains(company.name),
          selectedColor: Colors.purpleAccent,
          onSelected: (bool selected) {},
        ),
      ),
    );
  }

  insertItems(int index, String item) {
    favoriteList.insert(index, item);
    key.currentState!.insertItem(index);
  }

  removeItem(int index) {
    final item = favoriteList.value.removeAt(index);
    key.currentState!.removeItem(
      index,
      (BuildContext context, Animation<double> animation) =>
          buildItem(index, animation, context),
    );
  }
}
