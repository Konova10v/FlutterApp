import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'data.dart';

class User {
  User({
    required this.data,
  });
  Data data;

  factory User.fromJson(Map<String, dynamic> json) => User(
    data: Data.fromJson(json['data']),
  );

  Map<String, dynamic> toJson() => {
    'data': data.toJson(),
  };
}