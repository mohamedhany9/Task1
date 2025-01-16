

import 'package:taskgithub/data/model/github_model.dart';

abstract class ServiceRepository{
  Future<List<GithubModel>> getServices();
}