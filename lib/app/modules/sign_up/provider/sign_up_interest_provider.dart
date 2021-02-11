import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get_connect/connect.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/interestModel.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';

class SignUpInterestProvider extends GetConnect {
  Future<InterestModel> fetchInterests({String token}) async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }
    String url = BASEURL + INTERESTS;
    var response = await get(url, headers: {
      "Authorization": "Bearer " + token,
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
      InterestModel model = InterestModel.fromJson(res);
      return model;
    }
  }

  Future<bool> postInterests({String token, List<String> interests}) async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    ProgressDialog progressDialog = createProgressDialog();
    progressDialog.show();

    String url = BASEURL + POST_INTERESTS;
    var response = await post(url, {
      INTEREST_IDS_PARAM: interests
    }, headers: {
      "Authorization": "Bearer " + token,
    });

    progressDialog.hide();

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
      int statusCode = res[kStatusCode];
      return statusCode == 200;
    }
  }
}
