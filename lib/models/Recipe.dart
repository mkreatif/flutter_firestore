import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
  final int id;
  int role;
  String bahan, judul, cara, createdBy, updatedBy;
  Timestamp? createdAt = Timestamp.fromDate(DateTime.now()),
      updatedAt = Timestamp.fromDate(DateTime.now());

  Recipe(
      {required this.id,
      this.role = 0,
      this.bahan = "",
      this.judul = "",
      this.cara = "",
      this.createdBy = '',
      this.updatedBy = "",
      this.updatedAt,
      this.createdAt});

  factory Recipe.fromMap(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      role: json['role'],
      bahan: json['bahan'],
      judul: json['judul'],
      cara: json['cara'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "judul": judul,
        "cara": cara,
        "bahan": bahan,
        "role": role,
        "created_at": createdAt,
        "created_by": createdBy,
        "updated_at": updatedAt,
        "updated_by": updatedBy,
      };
}
