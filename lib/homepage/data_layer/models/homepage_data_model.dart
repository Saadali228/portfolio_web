class HomePageDataModel {
  final String name;
  final String title;
  final String subtitle;
  HomePageDataModel({
    required this.name,
    required this.title,
    required this.subtitle,
  });
  factory HomePageDataModel.fromJson(Map<String, dynamic> json) {
    return HomePageDataModel(
      name: json["name"],
      title: json["title"],
      subtitle: json["subtitle"],
    );
  }
}
