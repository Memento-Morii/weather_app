// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationModel {
  final String? name;
  final String? region;
  final String? country;
  LocationModel({
    this.name,
    this.region,
    this.country,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
