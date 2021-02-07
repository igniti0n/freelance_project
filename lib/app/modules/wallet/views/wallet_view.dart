import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project_one/app/modules/wallet/controllers/wallet_controller.dart';
import 'package:test_project_one/app/widgets/alert_dialog.dart';
import 'package:test_project_one/app/widgets/header.dart';
import 'package:test_project_one/app/widgets/wallet_price.dart';

class WalletView extends GetView<WalletController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                  onTap: () => () {},
                  child: Image.asset("assets/images/wallet.png")),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 160, right: 20, left: 20),
              child: Text(
                "G75,520.00",
                style: TextStyle(
                    fontFamily: "Gilroy", fontSize: 22, color: Colors.white),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text("Withdrawal History",
            style: GoogleFonts.telex(
                fontSize: 17,
                fontWeight: FontWeight.normal,
                color: Colors.black)),
      ),
      show_wallet_details(
          amount: "-3000", type: "Fund Withdrawal", date: "22 Jul 2020"),
      SizedBox(
        height: 10,
      ),
      show_wallet_details(
          amount: "-3000", type: "Fund Withdrawal", date: "22 Jul 2020")
    ])));
  }
}
