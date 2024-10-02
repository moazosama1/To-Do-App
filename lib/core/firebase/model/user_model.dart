class UserModel {
  String name;
  String id;
  String phone;
  String email;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phone: json['email']);
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "phone": phone, "email": email};
  }
}
