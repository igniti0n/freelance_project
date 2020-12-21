import 'package:get/get.dart';

import 'package:test_project_one/app/modules/ads_details/controllers/ads_details_controller.dart';

class AdsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdsDetailsController>(
      () => AdsDetailsController(),
    );
  }
}
