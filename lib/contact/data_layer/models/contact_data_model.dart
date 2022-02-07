class ContactDataModel {
  final String name;
  final String phone;
  final String email;
  ContactDataModel({
    required this.name,
    required this.phone,
    required this.email,
  });
  factory ContactDataModel.fromJson(Map<String, dynamic> json) {
    return ContactDataModel(
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
    );
  }
}
