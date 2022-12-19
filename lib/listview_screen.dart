import 'package:flutter/material.dart';
import 'package:flutter_application_4/cont.dart';
import 'package:get/get.dart';

class ListviewScreen extends StatefulWidget {
  const ListviewScreen({super.key});

  @override
  State<ListviewScreen> createState() => _MainAppState();
}

class _MainAppState extends State<ListviewScreen> {
  Controller controller = Get.put(Controller());
  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.insertItems(0, controller.textEditingController.text);
          },
        ),
        appBar: AppBar(
          title: const Text('Flutter List Animtion'),
        ),
        body: Obx(() => Column(
              children: [
                Container(
                  height: 70,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                      controller: controller.textEditingController,
                      onSubmitted: (value) {
                        controller.insertItems(0, value);
                      },
                      decoration: const InputDecoration(
                        enabled: true,
                        filled: true,
                        border: OutlineInputBorder(
                          gapPadding: 9.0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        hintText: "Enter anything",
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    child: controller.favoriteList.isEmpty
                        ? const SizedBox()
                        : Text(
                            "Recent Searches",
                            style: Theme.of(context).textTheme.button!.copyWith(
                                fontWeight: FontWeight.w900, fontSize: 20),
                          )),
                const SizedBox(
                  height: 10,
                ),
                controller.favoriteList.isEmpty
                    ? const SizedBox()
                    : Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: SizedBox(
                            // height: 200,
                            child: AnimatedList(
                                key: controller.key,
                                initialItemCount:
                                    controller.favoriteList.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index, animation) =>
                                    controller.buildItem(
                                        index, animation, context)),
                          ),
                        ),
                      ),
              ],
            )));
  }
}
