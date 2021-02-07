import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/myAdsModel.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/main.dart';

class MyAdsProvider extends GetConnect {
  Future<MyAdsModel> getMyAds() async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    String url = BASEURL + MY_ADS;
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
      MyAdsModel myAdsModel = MyAdsModel.fromJson(res);
      return myAdsModel;
    }
  }
}
