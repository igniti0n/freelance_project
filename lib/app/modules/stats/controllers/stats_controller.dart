import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/statsDataModel.dart';
import 'package:test_project_one/app/modules/stats/provider/stats_provider.dart';

class StatsController extends GetxController
    with StateMixin<StatsDetailDataModel> {
  final selectedYear = 2021.obs;

  @override
  void onInit() {
    super.onInit();
    getStatsData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  setYear({int value}) {
    selectedYear.value = value;
    getStatsData();
  }

  getStatsData() async {
    try {
      change(null, status: RxStatus.loading());
      StatsProvider statsProvider = StatsProvider();
      StatsDetailDataModel statsDetailDataModel =
          await statsProvider.getStatsData(year: selectedYear.value.toString());
      change(statsDetailDataModel, status: RxStatus.success());
    } catch (onError) {
      change(null, status: RxStatus.error(onError.message));
    }
  }
}
