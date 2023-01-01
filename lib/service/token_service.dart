import 'package:jwt_decode/jwt_decode.dart';

class TokenService {
  String? getValueByTokenAndKey(String token, String key) {
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    String? value = payload[key].toString();
    return value;
  }

  List<int> getValuesByTokenAndKey(String token, String key) {
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    List<int> values = List<int>.from(payload[key]);
    return values;
  }
}
