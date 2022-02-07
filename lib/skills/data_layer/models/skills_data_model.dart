class SkillsDataModel {
  final String id;
  final String title;
  final String image;
  final String description;
  SkillsDataModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });
  factory SkillsDataModel.fromJson(Map<String, dynamic> json) {
    return SkillsDataModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      description: json["description"],
    );
  }
}
