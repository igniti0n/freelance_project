import 'package:get/get.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project_one/app/data/API/api_calls.dart';
import 'package:test_project_one/app/data/models/login.dart';
import 'package:test_project_one/app/widgets/constants.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:test_project_one/app/widgets/progress_dialog.dart';
import 'package:test_project_one/main.dart';

///Temp Login
///"email": "daspecialman1@gmail.com",
///"password": "password"

class LoginProvider extends GetConnect {
  Future<LoginModel> login({String email, password}) async {
    var isInternetAvailable = await DataConnectionChecker().hasConnection;
    if (!isInternetAvailable) {
      throw Exception(Strings.NO_INTERNET);
    }

    ProgressDialog progressDialog = createProgressDialog();
    progressDialog.show();
    String url = BASEURL + LOGIN;
    Map body = {EMAIL_PARAM: email, PASSWORD_PARAM: password};
    var response = await post(url, body, headers: {
      "Content-Type": "application/json",
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
      final pref = await SharedPreferences.getInstance();
      var res = response.body;
      loginModel = LoginModel.fromJson(res);
      //Saving Data to Pref to retrieve later
      pref.setString(kUserData, loginModelToJson(loginModel));
      return loginModel;
    }
  }
}
