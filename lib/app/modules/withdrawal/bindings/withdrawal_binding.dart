import 'package:get/get.dart';
import 'package:test_project_one/app/modules/withdrawal/controllers/profileContoller.dart';

import 'package:test_project_one/app/modules/withdrawal/controllers/withdrawal_controller.dart';

class WithdrawalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WithdrawalController>(
      () => WithdrawalController(),
    );
     Get.lazyPut<WithdrawalController2>(
      () => WithdrawalController2(),
    );
  }
}
