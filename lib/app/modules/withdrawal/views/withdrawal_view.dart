import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:test_project_one/app/data/models/bankModel.dart';
import 'package:test_project_one/app/modules/withdrawal/controllers/withdrawal_controller.dart';
import 'package:test_project_one/app/widgets/button_widget.dart';
import 'package:test_project_one/app/widgets/colours.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';
import 'package:test_project_one/main.dart';

// ignore: must_be_immutable
class WithdrawalView extends GetView<WithdrawalController> {
  final WithdrawalController controller = Get.put(WithdrawalController());
  final TextEditingController accountName =
      new TextEditingController(text: loginModel.user.accountName);
  final TextEditingController accountNumber =
      new TextEditingController(text: loginModel.user.accountNumber);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: controller.obx(
            (profile) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Withdrawal Bank",
                    style: TextStyle(
                      fontFamily: "Gilroy-Light",
                      fontSize: 22,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 17, right: 17, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bank Name",
                          style: TextStyle(
                              fontFamily: "Gilroy",
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        controller.obx(
                          (data) => Container(
                            height:
                                controller.selectedBank.isNullOrBlank ? 60 : 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: SearchableDropdown.single(
                              displayClearIcon: false,
                              isExpanded: true,
                              underline: Container(),
                              label: Container(
                                height: controller.selectedBank.isNullOrBlank
                                    ? 8
                                    : 0,
                              ),
                              hint: "Select bank",
                              items: data.map((BankModel bank) {
                                //Done now hot restart
                                return new DropdownMenuItem<String>(
                                  value: bank.bankName,
                                  child: new Text(
                                    bank.bankName,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                );
                              }).toList(),
                              value: controller.selectedBank,
                              onClear: () {},
                              onChanged: (value) {
                                controller.setSelectedBank(value: value);
                              },
                            ),
                          ),

                          ///These two are not mandatory without these two you will still get the loading and the error
                          ///Are you clear now?
                          ///yeah Friend
                          ///
                          onLoading: Text(
                              'Loading'), //You can use any custom loaders here show when the status = RxStatus.loading()
                        )
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                textField(
                    controller: accountName,
                    signup: true,
                    name: "Account Name",
                    // placeholder: "Please Enter Here",
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Fill Field";
                      }
                    }),
                SizedBox(
                  height: 10,
                ),
                textField(
                    signup: true,
                    controller: accountNumber,
                    name: "Account Number",
                    // placeholder: "Please Enter Here",
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "Fill Field";
                      }
                    }),
                SizedBox(
                  height: 30,
                ),
                buttonWidget(
                    name: "Update",
                    onTap: () {
                      if (controller.selectedBank.isNullOrBlank) {
                        Get.snackbar(
                          Strings.ERROR,
                          Strings.NO_BANK_SEL,
                          duration: Duration(milliseconds: 5000),
                          backgroundColor: colour_time,
                          colorText: Colors.white,
                        );
                        return;
                      }
                      if (_formKey.currentState.validate()) {
                        controller.updateBankDetails(
                            name: accountName.text, number: accountNumber.text);
                      }
                    })
              ],
            ),
            onLoading: Container(height: Get.height * 0.8, child: Loader()),
          ),
        )));
  }
}
