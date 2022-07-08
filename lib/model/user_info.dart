import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserInfo {
  String name;
  String job;
  String? id;
  String? createdAt;

  UserInfo({
    required this.name,
    required this.job,
    this.id,
    this.createdAt,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    name: json['name'],
    job: json['job'],
    id: json['id'],
    createdAt: json['createdAt'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'job': job,
    'id': id,
    'createdAt': createdAt,
  };
}