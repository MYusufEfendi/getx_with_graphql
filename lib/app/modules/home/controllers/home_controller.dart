import 'package:get/get.dart';

import '../providers/get_data_provider_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  @override
  void onInit() {
    print("onInit");
    getData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  var list = [].obs;
  List<dynamic> characters = [];
  List posts = [];

  void getData() {
    getAllUsers().then((value) {
      list.clear();
      list.addAll(value);
    });
  }
}
