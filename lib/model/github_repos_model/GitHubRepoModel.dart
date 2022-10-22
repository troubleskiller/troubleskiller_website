class GitHubRepoModel {
  GitHubRepoModel({
    this.name,
    this.fullName,
    this.private,
    this.htmlUrl,
    this.description,
    this.defaultBranch,
  });

  GitHubRepoModel.fromJson(dynamic json) {
    name = json['name'];
    fullName = json['full_name'];
    private = json['private'];
    htmlUrl = json['html_url'];
    description = json['description'];
    defaultBranch = json['default_branch'];
  }
  String? name;
  String? fullName;
  bool? private;
  String? htmlUrl;
  String? description;
  String? defaultBranch;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['full_name'] = fullName;
    map['private'] = private;
    map['html_url'] = htmlUrl;
    map['description'] = description;
    map['default_branch'] = defaultBranch;
    return map;
  }
}

class GitHubRepoJSONModel {
  GitHubRepoJSONModel({
    this.result,
  });

  List<GitHubRepoModel>? result;

  factory GitHubRepoJSONModel.fromJson(List<dynamic> parsedJson) {
    List<GitHubRepoModel> repos =
        parsedJson.map((i) => GitHubRepoModel.fromJson(i)).toList();

    return GitHubRepoJSONModel(
      result: repos,
    );
  }
}
