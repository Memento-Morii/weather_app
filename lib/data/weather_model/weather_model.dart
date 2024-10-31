// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'location_model.dart';
import 'temperature_info.dart';

part 'weather_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherModel {
  final LocationModel? location;
  @JsonKey(name: "current")
  final TemperatureInfo? temperatureInfo;
  WeatherModel({
    this.location,
    this.temperatureInfo,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
