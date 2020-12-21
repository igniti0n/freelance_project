import 'package:get/get.dart';

import 'package:test_project_one/app/modules/my_ads/controllers/my_ads_controller.dart';

class MyAdsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAdsController>(
      () => MyAdsController(),
    );
  }
}
