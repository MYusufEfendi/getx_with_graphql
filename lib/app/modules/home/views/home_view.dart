import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            controller.list.isNotEmpty
                ? GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(2),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: (200 / 300),
                    crossAxisCount: 2,
                    children: List.generate(controller.list.length, (index) {
                      return Column(
                        children: [
                          Expanded(
                            child: Card(
                                shape: const RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    )),
                                child: Image.network(
                                  controller.list[index]['image'],
                                  fit: BoxFit.fill,
                                )
                                // SizedBox(
                                //   height: Get.height,
                                //   width: Get.width,
                                //   child: const Center(
                                //     child: Text('Testing'),
                                //   ),
                                // ),
                                ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(controller.list[index]?['name']?.toString() ??
                              ""),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(controller.list[index]?['status']?.toString() ??
                              "")
                        ],
                      );
                    }),
                  )
                : const Center(child: Text("Tidak ada data")),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.lime),
                  onPressed: () {
                    controller.getData();
                  },
                  child: Text('Elevated Button')),
            ),
          ],
        ),
      );
    });
  }
}
