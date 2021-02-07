import 'package:get/get.dart';
import 'package:test_project_one/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<DialogcontrollerController>(
    // 	() => DialogcontrollerController(),
    // );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
