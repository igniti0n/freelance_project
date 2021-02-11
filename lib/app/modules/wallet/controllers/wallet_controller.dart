import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/walletBalanceModel.dart';
import 'package:test_project_one/app/data/models/withdrawalTransactionsModel.dart';
import 'package:test_project_one/app/modules/wallet/provider/wallet_provider.dart';

class WalletController extends GetxController with StateMixin {
  //TODO: Implement WalletController
  List<TransactionDetailsModel> transList = [];
  final balance = 0.obs;

  @override
  void onInit() {
    fetchWithdrawalTransactions();
    fetchWalletBalance();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  fetchWithdrawalTransactions() async {
    try {
      change(null, status: RxStatus.loading());
      WalletProvider walletProvider = WalletProvider();
      WithdrawalTransactionsModel model =
          await walletProvider.fetchTransactions();
      transList.clear();
      transList.addAll(model.data);
      change(model, status: RxStatus.success());
    } catch (onError) {
      change(null, status: RxStatus.error(onError.message));
    }
  }

  fetchWalletBalance() async {
    try {
      WalletProvider walletProvider = WalletProvider();
      WalletBalanceModel model = await walletProvider.fetchBalance();
      balance.value = model.data.balance;
    } catch (onError) {
      change(null, status: RxStatus.error(onError.message));
    }
  }
}
