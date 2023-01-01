import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  int? id;
  String? name;
  DateTime? created_at;
  DateTime? updated_at;

  CategoryModel({
    this.id,
    this.name,
    this.created_at,
    this.updated_at,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
