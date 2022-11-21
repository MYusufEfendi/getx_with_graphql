import 'package:get/get.dart';
import 'package:getx_with_graphql/app/graphql_strings.dart';

import '../providers/get_detail_provider.dart';

class DetailController extends GetxController {
  @override
  void onInit() {
    print("onInit");
    getData();
    super.onInit();
  }

  var list = [].obs;
  List<dynamic> characters = [];
  List posts = [];
  var arguments = Get.arguments;

  void getData() {
    getDetail(id: arguments['id']).then((value) {
      list.clear();
      list.addAll(value);
    });
  }
}
