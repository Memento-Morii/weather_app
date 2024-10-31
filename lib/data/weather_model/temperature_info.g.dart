// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureInfo _$TemperatureInfoFromJson(Map<String, dynamic> json) =>
    TemperatureInfo(
      tempInCelsius: (json['temp_c'] as num?)?.toDouble(),
      condition: json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemperatureInfoToJson(TemperatureInfo instance) =>
    <String, dynamic>{
      'temp_c': instance.tempInCelsius,
      'condition': instance.condition?.toJson(),
    };

Condition _$ConditionFromJson(Map<String, dynamic> json) => Condition(
      name: json['text'] as String?,
      imageUrl: json['icon'] as String?,
    );

Map<String, dynamic> _$ConditionToJson(Condition instance) => <String, dynamic>{
      'text': instance.name,
      'icon': instance.imageUrl,
    };
