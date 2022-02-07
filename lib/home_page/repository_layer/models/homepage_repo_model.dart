class HomePageRepoModel {
  final String name;
  final String title;
  final String subtitle;
  HomePageRepoModel({
    required this.name,
    required this.title,
    required this.subtitle,
  });
  factory HomePageRepoModel.fromJson(Map<String, dynamic> json) {
    return HomePageRepoModel(
      name: json["name"],
      title: json["title"],
      subtitle: json["subtitle"],
    );
  }
}
