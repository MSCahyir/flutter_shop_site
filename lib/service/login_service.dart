import 'package:dio/dio.dart';
import 'package:ferisoft/constant/http_constants.dart';
import 'package:ferisoft/service/base_service.dart';
import 'package:ferisoft/service/shared_service.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginService extends BaseService {
  final prefsService = SharedService();

  Future<bool> login(String email, String password) async {
    var url = HttpConstants.login;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    url = url.replaceAll("{password}", password.toString());
    url = url.replaceAll("{email}", email.toString());

    Response resp = await createDio().post(url);

    if (resp.statusCode == 200) {
      var decode = resp.data["message"]["token"];
      prefsService.updateSharedPreferences(decode);
    }

    return true;
  }
}
