class AboutDataModel {
  final String name;
  final String title;
  final String statement;
  final List<Hobbies> hobbies;
  final List<Skills> skills;
  AboutDataModel({
    required this.name,
    required this.title,
    required this.statement,
    required this.hobbies,
    required this.skills,
  });
  factory AboutDataModel.fromJson(Map<String, dynamic> json) {
    return AboutDataModel(
      name: json["name"],
      title: json["title"],
      statement: json["statement"],
      hobbies: (json["hobbies"] as List)
          .map((state) => Hobbies.fromJson(state as Map<String, dynamic>))
          .toList(),
      skills: (json["skills"] as List)
          .map((state) => Skills.fromJson(state as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Hobbies {
  final String id;
  final String hobby;
  final String image;
  Hobbies({
    required this.id,
    required this.hobby,
    required this.image,
  });
  factory Hobbies.fromJson(Map<String, dynamic> json) {
    return Hobbies(
      id: json["id"],
      hobby: json["hobby"],
      image: json["image"],
    );
  }
}

class Skills {
  final String id;
  final String title;
  final String image;

  Skills({
    required this.id,
    required this.title,
    required this.image,
  });
  factory Skills.fromJson(Map<String, dynamic> json) {
    return Skills(
      id: json["id"],
      title: json["title"],
      image: json["image"],
    );
  }
}
