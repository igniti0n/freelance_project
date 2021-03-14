import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  Rx<DateTime> currentDate = DateTime.now().obs;
  final gender = "".obs;
  final religion = "".obs;
  RxString dOB = "01-01-2005".obs;
  final value = "Select Gender".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    dOB.value = "";
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(2005, 1, 1),
        firstDate: DateTime(1980),
        lastDate: DateTime(2005));
    if (pickedDate != null && pickedDate != currentDate.value)
      currentDate.value = pickedDate;
    dOB.value = pickedDate.toString();
  }
}
