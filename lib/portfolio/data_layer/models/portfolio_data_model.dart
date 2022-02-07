class PortfolioDataModel {
  final String id;
  final String title;
  final String image;
  PortfolioDataModel({
    required this.id,
    required this.title,
    required this.image,
  });
  factory PortfolioDataModel.fromJson(Map<String, dynamic> json) {
    return PortfolioDataModel(
      id: json["id"],
      title: json["title"],
      image: json["image"],
    );
  }
}
