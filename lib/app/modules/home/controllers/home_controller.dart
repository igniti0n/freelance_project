import 'package:get/get.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';

class HomeController extends GetxController {
  Webservice webservice = Get.find();
  final count = 0.obs;

  @override
  void onInit() {}

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() => count.value++;


  getUsercount(){
    return webservice.getUsercount();
  }

}
