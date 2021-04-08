import 'dart:developer';

import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/country.dart';
import 'package:test_project_one/app/modules/sign_up/provider/signUp.dart';

class SignUp2Controller extends GetxController with StateMixin<List<Country>> {
  //TODO: Implement SignUpController

  final country = "".obs;
  final countryID = "".obs;
  List<Country> countries = [];

  void fetchCountry() async {
    try {
      //TODO: REMOVE THE MOCK
      final List<Country> list = [
        Country(
            capital: "c",
            code2: "1",
            code3: "2",
            id: "id",
            name: "countryDummy",
            region: "dummyRegion",
            states: [],
            subregion: "dummySubregion"),
      ]; //await RegisterProvider().getCountries();
      countries = list;
      change(list, status: RxStatus.success());
    } catch (e) {
      log("error fuck me in the ass ${e.toString()}");
      // TODO
      change(null, status: RxStatus.error());
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCountry();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
