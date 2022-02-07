class AboutRepoModel {
  final String name;
  final String title;
  final String statement;
  final List<Hobbies> hobbies;
  AboutRepoModel({
    required this.name,
    required this.title,
    required this.statement,
    required this.hobbies,
  });
  factory AboutRepoModel.fromJson(Map<String, dynamic> json) {
    return AboutRepoModel(
      name: json["id"],
      title: json["title"],
      statement: json["image"],
      hobbies: Hobbies.fromJson(json["hobbies"]) as List<Hobbies>,
    );
  }
}

class Hobbies {
  final String id;
  final String hobby;
  Hobbies({
    required this.id,
    required this.hobby,
  });
  factory Hobbies.fromJson(Map<String, dynamic> json) {
    return Hobbies(
      id: json["id"],
      hobby: json["hobby"],
    );
  }
}
