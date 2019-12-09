import 'package:intl/intl.dart';

class ReposList {
  final List<Repo> repos;

  ReposList({this.repos});

  factory ReposList.fromJson(List<dynamic> json) {
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
  final String description;
  final String htmlUrl;
  final DateTime updatedAt;
  final String updatedAtFormatted;
  final int size;

  Repo({this.name, this.description, this.htmlUrl, this.updatedAt, this.updatedAtFormatted, this.size});

  factory Repo.fromJson(Map<String, dynamic> json) {
    String descriptionTemp = json['description'];
    if (descriptionTemp == "") {
      descriptionTemp = " - ";
    }
    DateTime dt = DateTime.parse(json['updated_at']);
    String dtFormatted = DateFormat('H:mm:ss - dd.MM.yyyy').format(dt);
    return new Repo(
        name: json['name'],
        description: descriptionTemp,
        htmlUrl: json['html_url'],
        updatedAt: DateTime.parse(json['updated_at']),
        updatedAtFormatted: dtFormatted,
        size: json['size']);
  }
}
