import 'package:dio/dio.dart';
import 'package:muta/network/network/api/constants.dart';

import '../../dio_client.dart';

class ApiRepo {
  final DioClient dioClient = DioClient(Dio());

  Future<Response> createAccountApi({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    try {
      final Response response = await dioClient.post(
        ApiConstants.createAccount,
        data: {
          "email": email,
          "firstName": firstName,
          "lastName": lastName,
          "password": password,
          "signinType": "password",
          "spokenLanguage": "7d0f00aa-1028-4871-abc1-0237dff35356",
          "userType": "learner",
          "country": {
            "name": "Nigeria",
            "code": "NG",
            "flag": "https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NG.svg"
          }
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loginUserApi(String email, String password) async {
    try {
      final Response response = await dioClient.post(
        cancelToken: CancelToken(),
        ApiConstants.login,
        data: {"email": email, "password": password},
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }


}
