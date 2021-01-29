import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  String firstname;
  @override
  void onInit() {
    super.onInit();
    getName();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
   getName() async {
    final pref = await SharedPreferences.getInstance();
    firstname = pref.getString("firstname");
    return firstname;
  }
}
