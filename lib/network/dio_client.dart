import 'package:design/model/user_info.dart';
import 'package:dio/dio.dart';
import '../model/user.dart';
import '../model/user_info.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://reqres.in/api';

  Future<User?> getUser({required String id}) async {
    User? user;
    try {
      Response userData = await _dio.get(_baseUrl + '/users/$id');
      print('User info: ${userData.data}');

      user = User.fromJson(userData.data);
    } on DioError catch (error) {
      if (error.response != null) {
        print('Dio error!');
        print('STATUS: ${error.response?.statusCode}');
        print('DATA: ${error.response?.data}');
        print('HEADERS: ${error.response?.headers}');
      } else {
        print('Error sending request!');
        print(error.message);
      }
    }

    return user;
  }

  Future<UserInfo?> createUser({required UserInfo userInfo}) async {
    UserInfo? retrievedUser;

    try {
      Response response = await _dio.post(_baseUrl + '/users', data: userInfo.toJson());
      print('User created: ${response.data}');
      retrievedUser = UserInfo.fromJson(response.data);
    } catch (error) {
      print('Error creating user: $error');
    }

    return retrievedUser;
  }
}