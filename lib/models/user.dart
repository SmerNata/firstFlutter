class UserResponse {
  final User? data;

  const UserResponse({required this.data});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return UserResponse(
      data: User.fromJson(data),
    );
  }
}
class UserListResponse {
  final List<User?> data;

  const UserListResponse({required this.data});

  factory UserListResponse.fromJson(Map<String, dynamic> json) {
    final list = json['data'] != null ? json['data'] as List : [];
    return UserListResponse(
      data: list.map((e) => User.fromJson(e)).toList(),
    );
  }
}
class User {
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}