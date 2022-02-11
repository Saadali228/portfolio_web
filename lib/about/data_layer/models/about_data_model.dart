class AboutDataModel {
  final String name;
  final String title;
  final String statement;
  final List<HobbiesData> hobbies;
  final List<SkillsData> skills;
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
          .map((state) => HobbiesData.fromJson(state as Map<String, dynamic>))
          .toList(),
      skills: (json["skills"] as List)
          .map((state) => SkillsData.fromJson(state as Map<String, dynamic>))
          .toList(),
    );
  }
}

class HobbiesData {
  final String id;
  final String hobby;
  final String image;
  HobbiesData({
    required this.id,
    required this.hobby,
    required this.image,
  });
  factory HobbiesData.fromJson(Map<String, dynamic> json) {
    return HobbiesData(
      id: json["id"],
      hobby: json["hobby"],
      image: json["image"],
    );
  }
}

class SkillsData {
  final String id;
  final String title;
  final String image;

  SkillsData({
    required this.id,
    required this.title,
    required this.image,
  });
  factory SkillsData.fromJson(Map<String, dynamic> json) {
    return SkillsData(
      id: json["id"],
      title: json["title"],
      image: json["image"],
    );
  }
}
