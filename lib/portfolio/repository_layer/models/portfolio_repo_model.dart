class PortfolioRepoModel {
  final String id;
  final String title;
  final String image;
  PortfolioRepoModel({
    required this.id,
    required this.title,
    required this.image,
  });
  factory PortfolioRepoModel.fromJson(Map<String, dynamic> json) {
    return PortfolioRepoModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
    );
  }
}
