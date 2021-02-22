import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/myAdsModel.dart';
import 'package:test_project_one/app/modules/my_ads/provider/my_ads_provider.dart';

class MyAdsController extends GetxController with StateMixin<MyAdsModel> {
  //TODO: Implement MyAdsController
  var adsList = List<MyAdsDataModel>();

  @override
  void onInit() {
    loadMyAds();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  loadMyAds() async {
    try {
      change(null, status: RxStatus.loading());
      MyAdsProvider _myAdsProvider = MyAdsProvider();
      MyAdsModel myAdsModel = await _myAdsProvider.getMyAds();
      adsList.clear();
      adsList.addAll(myAdsModel.data);
      adsList
          .sort((a, b) => b.ad.first.deadline.compareTo(a.ad.first.deadline));
      change(myAdsModel, status: RxStatus.success());
    } catch (onError) {
      change(null, status: RxStatus.error(onError.message));
    }
  }
}
