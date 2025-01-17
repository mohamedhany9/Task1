import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taskgithub/data/model/github_model.dart';
import 'dart:convert';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('github.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE repositories(
        id INTEGER PRIMARY KEY,
        node_id TEXT,
        name TEXT,
        full_name TEXT,
        private INTEGER,
        owner_login TEXT,
        owner_id INTEGER,
        owner_avatar_url TEXT,
        html_url TEXT,
        description TEXT,
        fork INTEGER,
        url TEXT,
        created_at TEXT,
        updated_at TEXT,
        pushed_at TEXT,
        language TEXT,
        stargazers_count INTEGER,
        watchers_count INTEGER,
        forks_count INTEGER
      )
    ''');
  }

  Future<void> insertRepositories(List<GithubModel> repositories) async {
    final db = await database;
    await db.transaction((txn) async {
      // Clear existing data
      await txn.delete('repositories');

      // Insert new data
      for (var repo in repositories) {
        await txn.insert(
          'repositories',
          {
            'id': repo.id,
            'node_id': repo.nodeId,
            'name': repo.name,
            'full_name': repo.fullName,
            'private': repo.private ? 1 : 0,
            'owner_login': loginValues.reverse[repo.owner.login], // Convert enum to string
            'owner_id': repo.owner.id,
            'owner_avatar_url': repo.owner.avatarUrl,
            'html_url': repo.htmlUrl,
            'description': repo.description,
            'fork': repo.fork ? 1 : 0,
            'url': repo.url,
            'created_at': repo.createdAt.toIso8601String(),
            'updated_at': repo.updatedAt.toIso8601String(),
            'pushed_at': repo.pushedAt.toIso8601String(),
            'language': repo.language,
            'stargazers_count': repo.stargazersCount,
            'watchers_count': repo.watchersCount,
            'forks_count': repo.forksCount,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }
    });
  }

  Future<List<GithubModel>> getRepositories() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('repositories');

    return List.generate(maps.length, (i) {
      // Create a modified map that includes the owner object structure
      final Map<String, dynamic> repoMap = {
        ...maps[i],
        'owner': {
          'login': maps[i]['owner_login'],
          'id': maps[i]['owner_id'],
          'node_id': nodeIdValues.map.keys.first, // Using default value since we don't store this
          'avatar_url': maps[i]['owner_avatar_url'],
          'gravatar_id': '',
          'url': 'https://api.github.com/users/${maps[i]['owner_login']}',
          'html_url': 'https://github.com/${maps[i]['owner_login']}',
          'followers_url': 'https://api.github.com/users/${maps[i]['owner_login']}/followers',
          'following_url': followingUrlValues.map.keys.first,
          'gists_url': gistsUrlValues.map.keys.first,
          'starred_url': starredUrlValues.map.keys.first,
          'subscriptions_url': 'https://api.github.com/users/${maps[i]['owner_login']}/subscriptions',
          'organizations_url': 'https://api.github.com/users/${maps[i]['owner_login']}/orgs',
          'repos_url': 'https://api.github.com/users/${maps[i]['owner_login']}/repos',
          'events_url': eventsUrlValues.map.keys.first,
          'received_events_url': 'https://api.github.com/users/${maps[i]['owner_login']}/received_events',
          'type': 'User',
          'site_admin': false,
          'user_view_type': 'public'
        },
        'private': maps[i]['private'] == 1,
        'fork': maps[i]['fork'] == 1,
      };

      return GithubModel.fromJson(repoMap);
    });
  }
}