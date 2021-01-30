import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/bankModel.dart';
import 'package:test_project_one/app/modules/withdrawal/provider/provider.dart';

class WithdrawalController extends GetxController
    with StateMixin<List<BankModel>> {
  //TODO: Implement WithdrawalController

  final count = 0.obs;
  final bankID = "".obs;
  final selectedBank = "".obs;
  List<BankModel> banks = [];
void fetchCountry() async {
    try {
      final List<BankModel> list = await BankProvider().getbank();
      banks = list;
      change(list, status: RxStatus.success());
    } catch (e) {
      // TODO
      change(null, status: RxStatus.error());
    }
  }
  @override
  void onInit() {
    super.onInit();
    fetchBanks();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
  void fetchBanks() async {
    try {
      final List<BankModel> list = await BankProvider().getbank();
      banks = list;
      change(list, status: RxStatus.success());
    } catch (e) {
      // TODO
      change(null, status: RxStatus.error());
    }
  }
}
