import '../../../../core/core.dart';
import '../../../select_role/app_role.dart';
import 'api_user_model.dart';

class ApiLoggedUserResponse {
  final String accessToken;
  final ApiUserModel user;

  const ApiLoggedUserResponse({required this.accessToken, required this.user});

  factory ApiLoggedUserResponse.fromJson(Map<String, dynamic> json) {
    return ApiLoggedUserResponse(accessToken: json["token"] ?? '', user: ApiUserModel.fromJson(_userJsonForEnvironment(json)));
  }

  static Map<String, dynamic> _userJsonForEnvironment(Map<String, dynamic> json) {
    if (CurrentAppRole.isClient) {
      return json["client"];
    } else if (CurrentAppRole.isProvider) {
      return json["provider"];
    }
    throw Exception('Invalid app environment or provider role');
  }

  TokenModel get getTokenForSingleSession {
    if (accessToken.isEmpty) {
      throw "ApiLoggedUserResponse accessToken is requried and cant be empty";
    }
    return TokenModel.forSingleSession(token: accessToken);
  }

  TokenModel get getAsValidTokenEntity {
    if (accessToken.isEmpty) {
      throw "ApiLoggedUserResponse accessToken is requried and cant be empty";
    }
    return TokenModel(token: accessToken);
  }
}
