import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/homeAds.dart';
import 'package:test_project_one/app/modules/forgotPassword2/user_app_bar_data/app_bar_data_provider.dart';

class AppBarDataController extends GetxController
    with StateMixin<AppBarDataModel> {
  @override
  void onInit() {
    loadAppBarData();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  loadAppBarData() async {
    try {
      change(null, status: RxStatus.loading());
      AppBarDataProvider _homeProvider = AppBarDataProvider();
      AppBarDataModel _dataModel;
      final aa = await _homeProvider.getAvailableAds();
      final ra = await _homeProvider.getRunningAds();
      final ca = await _homeProvider.getCompletedAds();
      final b = await _homeProvider.getBalance();
      _dataModel = AppBarDataModel(
        availableAds: aa,
        balance: b,
        completedAds: ca,
        runningAds: ra,
      );

      change(_dataModel, status: RxStatus.success());
    } catch (onError) {
      change(null, status: RxStatus.error(onError.toString()));
    }
  }
}

class AppBarDataModel {
  final double balance;
  final int availableAds;
  final int runningAds;
  final int completedAds;

  const AppBarDataModel(
      {this.availableAds, this.balance, this.completedAds, this.runningAds});
}
