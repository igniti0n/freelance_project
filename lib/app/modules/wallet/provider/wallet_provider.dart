import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get_connect/connect.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/walletBalanceModel.dart';
import 'package:test_project_one/app/data/models/withdrawalTransactionsModel.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';
import 'package:test_project_one/main.dart';

class WalletProvider extends GetConnect {
  Future<WithdrawalTransactionsModel> fetchTransactions() async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    String url = BASEURL + TRANSACTION;
    var response = await get(url, headers: {
      "Authorization": "Bearer " + loginModel.token,
    });

    if (response.hasError) {
      String responseText = (response.statusText.isNotEmpty)
          ? response.statusText
          : Strings.SOMETHING_WRONG;
      String errorMsg = (response.body != null)
          ? response.body[kMessage] ?? responseText
          : responseText;
      throw Exception(errorMsg);
    } else {
      var res = response.body;
      WithdrawalTransactionsModel transactionsModel =
          WithdrawalTransactionsModel.fromJson(res);
      return transactionsModel;
    }
  }

  Future<WalletBalanceModel> fetchBalance() async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    String url = BASEURL + WALLET_BAL;
    var response = await get(url, headers: {
      "Authorization": "Bearer " + loginModel.token,
    });

    if (response.hasError) {
      String responseText = (response.statusText.isNotEmpty)
          ? response.statusText
          : Strings.SOMETHING_WRONG;
      String errorMsg = (response.body != null)
          ? response.body[kMessage] ?? responseText
          : responseText;
      throw Exception(errorMsg);
    } else {
      var res = response.body;
      WalletBalanceModel walletBalanceModel = WalletBalanceModel.fromJson(res);
      return walletBalanceModel;
    }
  }

  Future<Map<String, dynamic>> widthdrawalRequest({String amount}) async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    ProgressDialog progressDialog = createProgressDialog();
    progressDialog.show();

    String url = BASEURL + WIDTHDRAWAL_REQ;
    var params = {AMOUNT: amount};
    var response = await post(url, params, headers: {
      "Authorization": "Bearer " + loginModel.token,
    });

    progressDialog.hide();
    if (response.hasError) {
      String responseText = (response.statusText.isNotEmpty)
          ? response.statusText
          : Strings.SOMETHING_WRONG;
      String errorMsg = (response.body != null)
          ? response.body[kMessage] ?? responseText
          : responseText;
      throw Exception(errorMsg);
    } else {
      return response.body;
    }
  }
}
