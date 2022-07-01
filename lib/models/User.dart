import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final int id;
  int role;
  String createdBy, updatedBy, email, password, username;
  Timestamp? createdAt = Timestamp.fromDate(DateTime.now()),
      updatedAt = Timestamp.fromDate(DateTime.now());

  User({
    required this.id,
    this.role = 0,
    this.createdBy = "",
    this.updatedBy = "",
    this.email = "",
    this.password = "",
    this.username = "",
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      role: json['role'],
      email: json['email'],
      password: json['password'],
      username: json['username'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "password": password,
        "username": username,
        "role": role,
        "created_at": createdAt,
        "created_by": createdBy,
        "updated_at": updatedAt,
        "updated_by": updatedBy,
      };
}
