import 'package:base_project/src/utils/network_client.dart';

class AuthenticationRepository {
  final NetworkClient networkClient;
  AuthenticationRepository(this.networkClient);

  ///
  ///
  ///
  Future<void> register({
    required String userName,
    required String email,
    required String password,
  }) async {
    final apiResponse = await networkClient.post(
      '/register',
      data: {
        'username': userName,
        'email': email,
        'password': password,
      },
    );
    if (apiResponse.isSuccess) {
    } else {}
  }

  ///
  ///
  ///
  Future<void> login({
    required String userName,
    required String email,
    required String password,
  }) async {
    final apiResponse = await networkClient.post(
      '/login',
      data: {
        'username': userName,
        'email': email,
        'password': password,
      },
    );
    if (apiResponse.isSuccess) {
    } else {}
  }
}
