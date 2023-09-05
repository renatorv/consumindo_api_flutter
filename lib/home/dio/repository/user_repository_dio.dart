import 'package:consumindo_api_flutter/home/dio/repository/i_user_repository.dart';
import 'package:consumindo_api_flutter/model/user_model.dart';
import 'package:dio/dio.dart';

class UserRepositoryDio implements IUserRepository {
  final Dio _dio;

  UserRepositoryDio(this._dio);

  @override
  Future<List<UserModel>> findAllUsers() async {
    try {
      // https://www.youtube.com/watch?v=2t0Xn2GT2J0&list=PLEXr-WZRgPjzjsyRxDWqVbwhKl60QnXhM&index=3 => 10 minutos
      final response = await _dio.get<List>('https://64f0db288a8b66ecf77a2e39.mockapi.io/users');

      List<UserModel> res = response.data!.map((e) => UserModel.fromMap(e)).toList();

      return res;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500) {}
      rethrow;
    }
  }
}
