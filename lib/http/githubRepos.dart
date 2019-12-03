class ReposList {
  final List<Repo> repos;

  ReposList({this.repos});

  factory ReposList.fromJson(List<dynamic> json) {
    // var list = json['list'] as List;
    // List<Repo> repos = list.map((i) => Repo.fromJson(i)).toList();
    // var list = json as List;
    List<Repo> repos = new List<Repo>();
    repos = json.map((i) => Repo.fromJson(i)).toList();

    return new ReposList(repos: repos);
  }

  List<Repo> getRepos() {
    return this.repos;
  }
}

class Repo {
  final String name;
  final String htmlUrl;

  Repo({this.name, this.htmlUrl});

  factory Repo.fromJson(Map<String, dynamic> json) {
    return new Repo(name: json['name'], htmlUrl: json['html_url']);
  }

  String getName() {
    return this.name;
  }

  String getHtmlurl() {
    return this.htmlUrl;
  }
}
