import 'package:get/get.dart';
import 'package:test_project_one/app/data/models/homeAds.dart';
import 'package:test_project_one/app/data/models/performanceListModel.dart';
import 'package:test_project_one/app/modules/performance_list_report/provider/performance_list_provider.dart';

class PerformanceListReportController extends GetxController
    with StateMixin<PerformanceListModel> {
  //TODO: Implement PerformanceListReportController
  var reportList = List<PerformanceDetails>();
  AdsDetailModel adsDetailModel;

  @override
  void onInit() {
    adsDetailModel = Get.arguments;
    loadReports();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  loadReports() async {
    try {
      change(null, status: RxStatus.loading());
      PerformanceListProvider provider = PerformanceListProvider();
      PerformanceListModel performanceListModel =
          await provider.getReports(id: adsDetailModel.id);
      reportList.clear();
      reportList.addAll(performanceListModel.data);
      reportList.sort((a, b) {
        return b.createdAt.compareTo(a.createdAt);
      });
      change(performanceListModel, status: RxStatus.success());
    } catch (onError) {
      change(null, status: RxStatus.error(onError.message));
    }
  }
}
