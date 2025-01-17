import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:taskgithub/data/datasource/service_api_service.dart';
import 'package:taskgithub/core/values/app_constants.dart';
import 'package:taskgithub/data/model/github_model.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
import 'service_api_service_test.mocks.dart';

void main() {
  late ServiceApiService service;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    service = ServiceApiService(dio: mockDio);
  });

  group('getService', () {
    final tResponseData = [
      {
        "id": 1,
        "node_id": "test_node_id",
        "name": "test_repo",
        "full_name": "test/repo",
        "private": false,
        "owner": {
          "login": "mralexgray",
          "id": 1,
          "node_id": "MDQ6VXNlcjI2MjUxNw==",
          "avatar_url": "test_url",
          "gravatar_id": "",
          "url": "test_url",
          "html_url": "test_url",
          "followers_url": "test_url",
          "following_url": "https://api.github.com/users/mralexgray/following{/other_user}",
          "gists_url": "https://api.github.com/users/mralexgray/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/mralexgray/starred{/owner}{/repo}",
          "subscriptions_url": "test_url",
          "organizations_url": "test_url",
          "repos_url": "test_url",
          "events_url": "https://api.github.com/users/mralexgray/events{/privacy}",
          "received_events_url": "test_url",
          "type": "User",
          "user_view_type": "public",
          "site_admin": false
        },
        "html_url": "test_url",
        "description": "test description",
        "fork": false,
        "url": "test_url",
        "forks_url": "test_url",
        "keys_url": "test_url",
        "collaborators_url": "test_url",
        "teams_url": "test_url",
        "hooks_url": "test_url",
        "issue_events_url": "test_url",
        "events_url": "test_url",
        "assignees_url": "test_url",
        "branches_url": "test_url",
        "tags_url": "test_url",
        "blobs_url": "test_url",
        "git_tags_url": "test_url",
        "git_refs_url": "test_url",
        "trees_url": "test_url",
        "statuses_url": "test_url",
        "languages_url": "test_url",
        "stargazers_url": "test_url",
        "contributors_url": "test_url",
        "subscribers_url": "test_url",
        "subscription_url": "test_url",
        "commits_url": "test_url",
        "git_commits_url": "test_url",
        "comments_url": "test_url",
        "issue_comment_url": "test_url",
        "contents_url": "test_url",
        "compare_url": "test_url",
        "merges_url": "test_url",
        "archive_url": "test_url",
        "downloads_url": "test_url",
        "issues_url": "test_url",
        "pulls_url": "test_url",
        "milestones_url": "test_url",
        "notifications_url": "test_url",
        "labels_url": "test_url",
        "releases_url": "test_url",
        "deployments_url": "test_url",
        "created_at": "2024-01-01T00:00:00Z",
        "updated_at": "2024-01-01T00:00:00Z",
        "pushed_at": "2024-01-01T00:00:00Z",
        "git_url": "test_url",
        "ssh_url": "test_url",
        "clone_url": "test_url",
        "svn_url": "test_url",
        "homepage": "test_url",
        "size": 100,
        "stargazers_count": 10,
        "watchers_count": 10,
        "language": "Dart",
        "has_issues": true,
        "has_projects": true,
        "has_downloads": true,
        "has_wiki": true,
        "has_pages": true,
        "has_discussions": true,
        "forks_count": 5,
        "mirror_url": null,
        "archived": false,
        "disabled": false,
        "open_issues_count": 2,
        "license": null,
        "allow_forking": true,
        "is_template": false,
        "web_commit_signoff_required": false,
        "topics": [],
        "visibility": "public",
        "forks": 5,
        "open_issues": 2,
        "watchers": 10,
        "default_branch": "master"
      }
    ];

    test('should return List<GithubModel> when API call is successful', () async {
      // arrange
      when(mockDio.get('${AppConstants.baseUrl}repos', options: anyNamed('options')))
          .thenAnswer((_) async => Response(
        data: tResponseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ));

      // act
      final result = await service.getService();

      // assert
      expect(result, isA<List<GithubModel>>());
      expect(result.length, 1);
      expect(result.first.id, 1);
      expect(result.first.name, "test_repo");
      verify(mockDio.get('${AppConstants.baseUrl}repos', options: anyNamed('options')));
      verifyNoMoreInteractions(mockDio);
    });

    test('should throw Exception when API call fails', () async {
      // arrange
      when(mockDio.get('${AppConstants.baseUrl}repos', options: anyNamed('options')))
          .thenThrow(DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to fetch Service',
      ));

      // act
      final call = service.getService;

      // assert
      expect(() => call(), throwsA(isA<Exception>()));
      verify(mockDio.get('${AppConstants.baseUrl}repos', options: anyNamed('options')));
      verifyNoMoreInteractions(mockDio);
    });
  });
}