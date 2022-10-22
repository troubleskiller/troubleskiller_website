import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:troubleskiller_blog/service/github_service/github_config.dart';

class GitHubService {
  Future<dynamic> getGitHubRepo() async {
    dynamic response;
    try {
      response = await Dio().get(GitHubConfig.githubRepoUrl);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return response;
  }
}
