class AboutDataModel {
  final String name;
  final String title;
  final String statement;
  final List<Hobbies> hobbies;
  AboutDataModel({
    required this.name,
    required this.title,
    required this.statement,
    required this.hobbies,
  });
  factory AboutDataModel.fromJson(Map<String, dynamic> json) {
    return AboutDataModel(
        name: json["name"],
        title: json["title"],
        statement: json["statement"],
        hobbies: (json["hobbies"] as List)
            .map((state) => Hobbies.fromJson(state as Map<String, dynamic>))
            .toList());
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
