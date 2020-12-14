import 'package:get/get.dart';
import 'package:test_project_one/app/modules/sigin_in/controllers/sigin_in_controller.dart';

class SiginInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SiginInController>(
      () => SiginInController(),
    );
  }
}
