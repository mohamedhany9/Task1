import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:taskgithub/domain/repositories/service_repository.dart';
import 'package:taskgithub/domain/usecases/get_services.dart';
import 'package:taskgithub/data/model/github_model.dart';

@GenerateNiceMocks([MockSpec<ServiceRepository>()])
import 'get_services_test.mocks.dart';

void main() {
  late GetServices usecase;
  late MockServiceRepository mockRepository;

  setUp(() {
    mockRepository = MockServiceRepository();
    usecase = GetServices(mockRepository);
  });

  final tGithubModels = [
    GithubModel(
      id: 1,
      nodeId: "test_node_id",
      name: "test_repo",
      fullName: "test/repo",
      private: false,
      owner: Owner(
        login: Login.MRALEXGRAY,
        id: 1,
        nodeId: NodeId.MDQ6_VX_NLCJ_I2_MJ_UX_NW,
        avatarUrl: "test_url",
        gravatarId: "",
        url: "test_url",
        htmlUrl: "test_url",
        followersUrl: "test_url",
        followingUrl: FollowingUrl.HTTPS_API_GITHUB_COM_USERS_MRALEXGRAY_FOLLOWING_OTHER_USER,
        gistsUrl: GistsUrl.HTTPS_API_GITHUB_COM_USERS_MRALEXGRAY_GISTS_GIST_ID,
        starredUrl: StarredUrl.HTTPS_API_GITHUB_COM_USERS_MRALEXGRAY_STARRED_OWNER_REPO,
        subscriptionsUrl: "test_url",
        organizationsUrl: "test_url",
        reposUrl: "test_url",
        eventsUrl: EventsUrl.HTTPS_API_GITHUB_COM_USERS_MRALEXGRAY_EVENTS_PRIVACY,
        receivedEventsUrl: "test_url",
        type: Type.USER,
        userViewType: Visibility.PUBLIC,
        siteAdmin: false,
      ),
      htmlUrl: "test_url",
      description: "test description",
      fork: false,
      url: "test_url",
      forksUrl: "test_url",
      keysUrl: "test_url",
      collaboratorsUrl: "test_url",
      teamsUrl: "test_url",
      hooksUrl: "test_url",
      issueEventsUrl: "test_url",
      eventsUrl: "test_url",
      assigneesUrl: "test_url",
      branchesUrl: "test_url",
      tagsUrl: "test_url",
      blobsUrl: "test_url",
      gitTagsUrl: "test_url",
      gitRefsUrl: "test_url",
      treesUrl: "test_url",
      statusesUrl: "test_url",
      languagesUrl: "test_url",
      stargazersUrl: "test_url",
      contributorsUrl: "test_url",
      subscribersUrl: "test_url",
      subscriptionUrl: "test_url",
      commitsUrl: "test_url",
      gitCommitsUrl: "test_url",
      commentsUrl: "test_url",
      issueCommentUrl: "test_url",
      contentsUrl: "test_url",
      compareUrl: "test_url",
      mergesUrl: "test_url",
      archiveUrl: "test_url",
      downloadsUrl: "test_url",
      issuesUrl: "test_url",
      pullsUrl: "test_url",
      milestonesUrl: "test_url",
      notificationsUrl: "test_url",
      labelsUrl: "test_url",
      releasesUrl: "test_url",
      deploymentsUrl: "test_url",
      createdAt: DateTime.parse("2024-01-01"),
      updatedAt: DateTime.parse("2024-01-01"),
      pushedAt: DateTime.parse("2024-01-01"),
      gitUrl: "test_url",
      sshUrl: "test_url",
      cloneUrl: "test_url",
      svnUrl: "test_url",
      homepage: "test_url",
      size: 100,
      stargazersCount: 10,
      watchersCount: 10,
      language: "Dart",
      hasIssues: true,
      hasProjects: true,
      hasDownloads: true,
      hasWiki: true,
      hasPages: true,
      hasDiscussions: true,
      forksCount: 5,
      mirrorUrl: null,
      archived: false,
      disabled: false,
      openIssuesCount: 2,
      license: null,
      allowForking: true,
      isTemplate: false,
      webCommitSignoffRequired: false,
      topics: [],
      visibility: Visibility.PUBLIC,
      forks: 5,
      openIssues: 2,
      watchers: 10,
      defaultBranch: DefaultBranch.MASTER,
    )
  ];

  test('should get list of github repositories from the repository', () async {
    // arrange
    when(mockRepository.getServices())
        .thenAnswer((_) async => tGithubModels);

    // act
    final result = await usecase();

    // assert
    expect(result, tGithubModels);
    verify(mockRepository.getServices());
    verifyNoMoreInteractions(mockRepository);
  });
}