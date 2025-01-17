import 'package:dio/dio.dart';
import 'package:taskgithub/core/values/app_constants.dart';
import 'package:taskgithub/data/model/github_model.dart';


class ServiceApiService {
  final Dio dio;

  ServiceApiService({Dio? dio}) : dio = dio ?? Dio();

  Future<List<GithubModel>> getService() async {
    try {
      final resopnse = await dio.get('${AppConstants.baseUrl}repos',
          options: Options());

      List<GithubModel> data = (resopnse.data as List)
          .map((json) => GithubModel.fromJson(json))
          .toList();

      return data;
    } catch (e) {
      throw Exception('Faild to fetch Service');
    }
  }
}
