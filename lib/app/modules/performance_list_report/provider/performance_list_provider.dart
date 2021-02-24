import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/performanceListModel.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/main.dart';

class PerformanceListProvider extends GetConnect {
  Future<PerformanceListModel> getReports({String id}) async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    String url = BASEURL + PERFORMANCE_LIST_REPORTS + id;
    var response = await get(url, headers: {
      "Authorization": "Bearer " + loginModel.token,
    });

    if (response.hasError) {
      String responseText = (response.statusText.isNotEmpty)
          ? response.statusText
          : Strings.SOMETHING_WRONG;
      String errorMsg = (response.body != null)
          ? response.body[kMessage] ?? responseText
          : responseText;
      throw Exception(errorMsg);
    } else {
      var res = response.body;
      PerformanceListModel performanceListModel =
          PerformanceListModel.fromJson(res);
      return performanceListModel;
    }
  }
}
