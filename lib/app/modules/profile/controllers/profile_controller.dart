import 'package:get/get.dart';
import 'package:test_project_one/app/modules/profile/provider/profile.dart';

class ProfileController extends GetxController with StateMixin<List<dynamic>> {
  //TODO: Implement ProfileController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    ProfileProvider().getProfile().then((value) {
      change(value, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
  updateProfile({
    String firstname,
    String lastname,
    String phone,
    String religion,
    String education,
    String country,
    String address,
    String facebook,
    String twitter,
    String instagram,
    String youtube,
  }) {
    ProfileProvider()
        .updateProfile(
            firstname: firstname,
            lastname: lastname,
            phone: phone,
            religion: religion,
            education: education,
            country: country,
            address: address,
            facebook: facebook,
            twitter: twitter,
            instagram: instagram,
            youtube: youtube)
        .then((g) {
      change(g, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error());
    });
  }
}
