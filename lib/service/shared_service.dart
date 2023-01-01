import 'package:ferisoft/constant/shared_preferences_constants.dart';
import 'package:ferisoft/constant/token_constants.dart';
import 'package:ferisoft/service/token_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  final tokenService = TokenService();

  void updateSharedPreferences(token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String resetKey =
        tokenService.getValueByTokenAndKey(token, TokenConstants.jti) ?? "";

    prefs.setString(SharedPreferencesConstants.token, token ?? "");
  }
}
