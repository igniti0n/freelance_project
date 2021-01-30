import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:test_project_one/app/data/models/bankModel.dart';
import 'package:test_project_one/app/modules/withdrawal/controllers/profileContoller.dart';
import 'package:test_project_one/app/modules/withdrawal/controllers/withdrawal_controller.dart';
import 'package:test_project_one/app/routes/app_pages.dart';
import 'package:test_project_one/app/widgets/button-widget.dart';
import 'package:test_project_one/app/widgets/text_fields.dart';

class WithdrawalView extends GetView<WithdrawalController> {
  WithdrawalController _controller = Get.put(WithdrawalController());
  WithdrawalController2 _controller2 = Get.put(WithdrawalController2());
  TextEditingController bank = new TextEditingController();
  TextEditingController accountName ;
  TextEditingController accountNumber;
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
            child: _controller2.obx((profile)=> Column(
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
                        _controller.obx(
                          (data) => Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Center(
                              child: SearchableDropdown.single(
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return "Can't be empty";
                                  }
                                },
                                displayClearIcon: false,
                                isExpanded: true,
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
                                value: _controller.selectedBank.value,
                                onClear: () {},
                                onChanged: (value) {
                                  _controller.selectedBank.value;

                                  for (var i in controller.banks) {
                                    if (i.bankName ==
                                        _controller.selectedBank.value) {
                                      _controller.bankID.value = i.id;
                                      print(_controller.selectedBank.value);
                                    }
                                  }
                                },
                              ),
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
                    controller: accountName=TextEditingController(text: profile[0]["account_name"].toString()),
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
                    controller: accountNumber=TextEditingController(text: profile[0]["account_number"].toString()),
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
                display_button(
                    name: "Update",
                    function: () {
                     if(_formKey.currentState.validate()){
                       
                     }
                    })
              ],
            ),
          ),
        )));
  }
}
