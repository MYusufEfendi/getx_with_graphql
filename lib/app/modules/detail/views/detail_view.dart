import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var data = controller.list.value;
      return Scaffold(
        appBar: AppBar(
          title: Text('DetailView'),
          centerTitle: true,
        ),
        body: data.isNotEmpty
            ? Column(
                children: [
                  SizedBox(
                    width: Get.width,
                    height: 200,
                    child: Card(
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            )),
                        child: Image.network(
                          controller.list[0]['image'],
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(controller.list[0]?['name']?.toString() ?? ""),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(controller.list[0]?['status']?.toString() ?? "")
                ],
              )
            : const Center(
                child:   CircularProgressIndicator(
                  // backgroundColor: Colors.redAccent,
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                  strokeWidth: 2,
                ),
              ),
      );
    });
  }
}
