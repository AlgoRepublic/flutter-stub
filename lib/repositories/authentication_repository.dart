import 'package:base_project/src/utils/network_client.dart';

class AuthenticationRepository {
  final NetworkClient networkClient;
  AuthenticationRepository(this.networkClient);

  ///
  ///
  ///
  Future<ApiResponse<String>> register({
    required String userName,
    required String email,
    required String password,
  }) async {
    final apiResponse = await networkClient.post<String>(
      '/register',
      data: {
        'username': userName,
        'email': email,
        'password': password,
      },
    );
    if (apiResponse.isSuccess) {
      return apiResponse.copyWith(data: apiResponse.rawData['token']);
    } else {
      return apiResponse;
    }
  }

  ///
  ///
  ///
  Future<ApiResponse<String>> login({
    required String userName,
    required String email,
    required String password,
  }) async {
    final apiResponse = await networkClient.post<String>(
      '/login',
      data: {
        'username': userName,
        'email': email,
        'password': password,
      },
    );
    if (apiResponse.isSuccess) {
      return apiResponse.copyWith(data: apiResponse.rawData['token']);
    } else {
      return apiResponse;
    }
  }
}
