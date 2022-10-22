import 'package:dio/dio.dart';
import 'package:troubleskiller_blog/model/github_repos_model/GitHubRepoModel.dart';
import 'package:troubleskiller_blog/service/github_service/github_service.dart';

class GitHubController {
  final GitHubService _githubService = GitHubService();
  Future<List<GitHubRepoModel>> getRepos() async {
    List<GitHubRepoModel> results = [];
    Response response = await _githubService.getGitHubRepo();
    print(response);
    results = GitHubRepoJSONModel.fromJson(response.data).result ?? [];
    return results;
  }
}
