import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project_one/app/data/models/withdrawalTransactionsModel.dart';
import 'package:test_project_one/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/error_page.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';
import 'package:test_project_one/app/widgets/textfield_dialog.dart';
import 'package:test_project_one/app/widgets/wallet_price.dart';
import 'package:intl/intl.dart';

class WalletView extends GetView<WalletController> {
  final _walletController = Get.put(WalletController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () => () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFFE3534D).withOpacity(0.3),
                            offset: Offset(0.0, 10.0), //(x,y)
                            blurRadius: 16.0,
                            spreadRadius: 0),
                      ],
                    ),
                    child: Image.asset("assets/images/wallet.png"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 16),
                  child: Text(
                    "Wallet Balance",
                    style: TextStyle(
                        fontFamily: "Gilroy-Medium", color: Colors.white),
                    textScaleFactor: 1.1,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, bottom: 8, right: 8),
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return Text(
                            "G" + _walletController.balance.string,
                            style: TextStyle(
                                fontFamily: "Gilroy-Medium",
                                color: Colors.white),
                            textScaleFactor: 1.5,
                          );
                        }),
                        IconButton(
                          icon: Image.asset(
                            "assets/images/withdrawal.png",
                            color: Colors.black,
                          ),
                          onPressed: () {
                            showPopupDialogWithTextField(
                              context: context,
                              heading: 'Withdrawal Request',
                              hintText: 'Please Enter here',
                              subTitle: 'Enter Amount',
                              leftButtonTitle: 'Cancel',
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              onPressedLeftButton: () {
                                Get.back();
                              },
                              rightButtonTitle: 'Request',
                              onPressedRightButton: (value) {
                                if (value.isAlphabetOnly) {
                                  Get.snackbar(Strings.ERROR,
                                      "Please enter proper number.",
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor: colour_time,
                                      colorText: Colors.white, onTap: (obj) {
                                    Get.back(result: true);
                                  });
                                } else {
                                  _walletController.widthdrawalRequest(
                                      amount: value);
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Withdrawal History",
              style: GoogleFonts.telex(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black)),
        ),
        _walletController.obx(
          (state) => _buildWithdrawalList(),
          onLoading: Loader(),
          onError: (error) {
            return ErrorView(
              errorMsg: error,
              onTapReload: () {
                _walletController.fetchWithdrawalTransactions();
              },
            );
          },
        ),
      ]),
    ));
  }

  _buildWithdrawalList() {
    return _walletController.transList.length > 0
        ? Column(
            children: List.generate(
              _walletController.transList.length,
              (index) {
                TransactionDetailsModel model =
                    _walletController.transList[index];
                final DateTime now = model.updatedAt;
                DateFormat formatter = DateFormat('dd LLL yyyy');
                final String formatted = formatter.format(now);

                return transactionDetailCard(
                    amount: model.amount.toString(),
                    type: model.transactionType,
                    date: formatted);
              },
            ),
          )
        : Container(
            height: 150,
            child: Center(
              child: Text(
                Strings.NO_TRANSACTION_MSG,
                style: TextStyle(
                    fontFamily: "Gilroy-Light",
                    fontSize: 18,
                    color: Colors.black),
              ),
            ),
          );
    ;
  }
}
