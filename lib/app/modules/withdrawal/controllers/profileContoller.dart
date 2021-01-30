import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/bankModel.dart';
import 'package:test_project_one/app/modules/profile/provider/profile.dart';
import 'package:test_project_one/app/modules/withdrawal/provider/provider.dart';

class WithdrawalController2 extends GetxController
    with StateMixin<List<dynamic>> {
  //TODO: Implement WithdrawalController

  @override
  void onInit() {
    super.onInit();
      ProfileProvider().getProfile().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
