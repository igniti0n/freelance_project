import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/walletBalanceModel.dart';
import 'package:test_project_one/app/data/models/withdrawalTransactionsModel.dart';
import 'package:test_project_one/app/modules/wallet/provider/wallet_provider.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';

class WalletController extends GetxController with StateMixin {
  //TODO: Implement WalletController
  List<TransactionDetailsModel> transList = [];
  final balance = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getWalletData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getWalletData() {
    fetchWithdrawalTransactions();
    fetchWalletBalance();
  }

  fetchWithdrawalTransactions() async {
    try {
      change(null, status: RxStatus.loading());
      WalletProvider walletProvider = WalletProvider();
      WithdrawalTransactionsModel model =
          await walletProvider.fetchTransactions();
      transList.clear();
      transList.addAll(model.data);
      print("Fetched Transaction");
      change(model, status: RxStatus.success());
    } catch (onError) {
      print("Error While Fetching Transaction $onError");
      change(null, status: RxStatus.error(onError.message));
    }
  }

  fetchWalletBalance() async {
    try {
      WalletProvider walletProvider = WalletProvider();
      WalletBalanceModel model = await walletProvider.fetchBalance();
      balance.value = model.data.balance;
    } catch (onError) {
      // change(null, status: RxStatus.error(onError.message));
    }
  }

  widthdrawalRequest({String amount}) async {
    try {
      WalletProvider walletProvider = WalletProvider();
      Map<String, dynamic> response =
          await walletProvider.widthdrawalRequest(amount: amount);
      String message = response[kMessage] ?? 'Transaction is been processed';
      int statusCode = response[kStatusCode] ?? -1;
      Get.snackbar(Strings.SUCCESS, message,
          duration: Duration(milliseconds: 2000),
          backgroundColor: colour_time,
          colorText: Colors.white, snackbarStatus: (status) {
        if (status == SnackbarStatus.CLOSED) {
          if (statusCode == 201) {
            Get.back(result: true);
            getWalletData();
          }
        }
      }, onTap: (obj) {
        Get.back(result: true);
        getWalletData();
      });
    } catch (onError) {
      Get.snackbar(Strings.ERROR, onError.message,
          duration: Duration(milliseconds: 2000),
          backgroundColor: colour_time,
          colorText: Colors.white, onTap: (obj) {
        Get.back(result: true);
      });
    }
  }
}
