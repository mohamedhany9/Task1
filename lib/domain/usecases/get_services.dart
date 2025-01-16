import 'package:taskgithub/data/model/github_model.dart';
import 'package:taskgithub/domain/repositories/service_repository.dart';

class GetServices{
  final ServiceRepository repository;

  GetServices(this.repository);

  Future<List<GithubModel>> call() async{
    return await repository.getServices();
  }
}