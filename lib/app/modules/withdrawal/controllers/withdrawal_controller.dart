import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/bankModel.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/modules/withdrawal/provider/provider.dart';
import 'package:test_project_one/main.dart';

class WithdrawalController extends GetxController
    with StateMixin<List<BankModel>> {
  //TODO: Implement WithdrawalController

  final count = 0.obs;
  final bankID = "".obs;
  String selectedBank = "";
  List<BankModel> banks = [];

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

  setSelectedBank({String value}) {
    selectedBank = value;
    change(this.state, status: RxStatus.success());
  }

  void fetchBanks() async {
    try {
      final List<BankModel> list = await BankProvider().getbank();
      banks = list;
      for (var i in banks) {
        if (i.id == loginModel.user.bankId) {
          selectedBank = i.bankName;
        }
      }
      change(list, status: RxStatus.success());
    } catch (e) {
      // TODO
      change(null, status: RxStatus.error());
    }
  }

  updateBankDetails({String name, String number}) {
    String bankId = '';
    for (var i in banks) {
      if (i.bankName == selectedBank) {
        bankId = i.id;
      }
    }
    Map params = {
      BANK_ID_PARAM: bankId,
      BANK_ACC_NAME_PARAM: name,
      BANK_ACC_NUM_PARAM: number
    };

    BankProvider().updateBank(params: params).then((userUpdatedDetails) async {
      if (userUpdatedDetails != null) {
        loginModel.user = userUpdatedDetails;
        final pref = await SharedPreferences.getInstance();
        pref.setString(kUserData, loginModelToJson(loginModel));
      } else {
        // change(null, status: RxStatus.error('Error While Updating Profile'));
      }
    }, onError: (error) {
      // change(null, status: RxStatus.error());
    });
  }
}
