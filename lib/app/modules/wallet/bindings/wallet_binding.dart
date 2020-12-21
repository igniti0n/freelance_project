import 'package:get/get.dart';

import 'package:test_project_one/app/modules/wallet/controllers/wallet_controller.dart';

class WalletBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletController>(
      () => WalletController(),
    );
  }
}
