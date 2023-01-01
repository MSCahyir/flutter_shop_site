import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  int? id;
  String? category_id;
  String? name;
  String? image;
  String? votes;
  String? price;
  DateTime? created_at;
  DateTime? updated_at;

  ProductModel({
    this.id,
    this.category_id,
    this.name,
    this.image,
    this.votes,
    this.price,
    this.created_at,
    this.updated_at,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
