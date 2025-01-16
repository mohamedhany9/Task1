

import 'package:taskgithub/data/datasource/service_api_service.dart';
import 'package:taskgithub/data/model/github_model.dart';
import 'package:taskgithub/domain/repositories/service_repository.dart';

class ServiceRepositoryImpl implements ServiceRepository{
  final ServiceApiService serviceApiService;

  ServiceRepositoryImpl(this.serviceApiService);

  @override
  Future<List<GithubModel>> getServices() async{
    return await serviceApiService.getService();
  }
}