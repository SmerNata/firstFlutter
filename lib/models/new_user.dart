class NewUser {
  String name;
  String job;
  String? id;
  String? createdAt;
  String? updatedAt;

  NewUser({
    required this.name,
    required this.job,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory NewUser.fromJson(Map<String, dynamic> json) => NewUser(
    name: json['name'] as String,
    job: json['job'] as String,
    id: json['id'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
  );
  Map<String, dynamic> toJson() => {
      'name': name,
      'job': job,
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
}