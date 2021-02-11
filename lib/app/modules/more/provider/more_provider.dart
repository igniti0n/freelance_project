import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get/get_connect/connect.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';
import 'package:test_project_one/main.dart';

class MoreProvider extends GetConnect {
  Future<dynamic> deleteAccount({String password}) async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    ProgressDialog progressDialog = createProgressDialog();
    progressDialog.show();

    String url = BASEURL + REGISTER;
    Map body = {PASSWORD_PARAM: password};
    var response = await request(url, 'delete', body: body, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer " + loginModel.token,
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
      print(res);
      return res;
    }
  }
}
