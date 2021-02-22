import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/homeAds.dart';
import 'package:test_project_one/app/modules/home/provider/home_provider.dart';

class HomeController extends GetxController with StateMixin<HomeAdsModel> {
  var adsList = List<AdsDetailModel>();

  @override
  void onInit() {
    loadAds();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  loadAds() async {
    try {
      change(null, status: RxStatus.loading());
      HomeProvider _homeProvider = HomeProvider();
      HomeAdsModel _homeAdsModel = await _homeProvider.getAds();
      adsList.clear();
      adsList.addAll(_homeAdsModel.data);
      adsList.sort((a, b) => b.deadline.compareTo(a.deadline));
      change(_homeAdsModel, status: RxStatus.success());
    } catch (onError) {
      change(null, status: RxStatus.error(onError.message));
    }
  }
}
