import 'package:base_project/repositories/network_client.dart';

class AuthenticationRepository {
  final NetworkClient networkClient;
  AuthenticationRepository(this.networkClient);

  ///
  ///
  ///
  Future<void> register(
    String userName,
    String email,
    String password,
  ) async {
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
  Future<void> login(
    String userName,
    String email,
    String password,
  ) async {
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
