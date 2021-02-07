import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get_connect/connect.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/homeAds.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/widgets/constants.dart';

class HomeProvider extends GetConnect {
  Future<HomeAdsModel> getAds() async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    LoginModel loginModel = await LoginModel.fromPrefs();
    String url = BASEURL + HOME_ADS;
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
      HomeAdsModel homeAdsModel = HomeAdsModel.fromJson(res);
      return homeAdsModel;
    }
  }
}
