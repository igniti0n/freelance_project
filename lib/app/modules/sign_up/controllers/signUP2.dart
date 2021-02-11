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
      final List<Country> list = await RegisterProvider().getCountries();
      countries = list;
      change(list, status: RxStatus.success());
    } catch (e) {
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
