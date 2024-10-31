// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'temperature_info.g.dart';

@JsonSerializable(explicitToJson: true)
class TemperatureInfo {
  @JsonKey(name: "temp_c")
  final double? tempInCelsius;
  final Condition? condition;
  TemperatureInfo({
    this.tempInCelsius,
    this.condition,
  });

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) =>
      _$TemperatureInfoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$TemperatureInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Condition {
  @JsonKey(name: "text")
  final String? name;
  @JsonKey(name: "icon")
  final String? imageUrl;
  Condition({
    this.name,
    this.imageUrl,
  });

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
