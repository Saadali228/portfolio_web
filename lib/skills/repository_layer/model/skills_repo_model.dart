class SkillsRepoModel {
  final String id;
  final String title;
  final String image;
  final String description;
  SkillsRepoModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
  });
  factory SkillsRepoModel.fromJson(Map<String, dynamic> json) {
    return SkillsRepoModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      description: json["description"],
    );
  }
}
