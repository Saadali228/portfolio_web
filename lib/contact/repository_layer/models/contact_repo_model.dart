class ContactRepoModel {
  final String name;
  final String phone;
  final String email;
  ContactRepoModel({
    required this.name,
    required this.phone,
    required this.email,
  });
  factory ContactRepoModel.fromJson(Map<String, dynamic> json) {
    return ContactRepoModel(
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
    );
  }
}
