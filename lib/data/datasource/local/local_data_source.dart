import 'package:taskgithub/data/datasource/local/database_helper.dart';
import 'package:taskgithub/data/model/github_model.dart';

class LocalDataSource {
  final DatabaseHelper dbHelper;

  LocalDataSource({DatabaseHelper? dbHelper})
      : this.dbHelper = dbHelper ?? DatabaseHelper.instance;

  Future<List<GithubModel>> getLocalRepositories() async {
    return await dbHelper.getRepositories();
  }

  Future<void> saveRepositories(List<GithubModel> repositories) async {
    await dbHelper.insertRepositories(repositories);
  }
}