import 'package:get/get.dart';
import 'package:test_project_one/app/modules/sign_up/controllers/signUPMedia.dart';

class SignUpMediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpMediaController>(
      () => SignUpMediaController(),
    );
  }
}
