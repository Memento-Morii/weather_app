// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ErrorModel {
  final String? message;
  final int? code;
  ErrorModel({
    this.message,
    this.code,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
