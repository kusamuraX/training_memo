// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parts_training_info_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartsTrainingInfoImpl _$$PartsTrainingInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$PartsTrainingInfoImpl(
      partsId: json['partsId'] as int,
      partsTrainingId: json['partsTrainingId'] as int,
      trainingName: json['trainingName'] as String,
      maxRm: json['maxRm'] as int?,
    );

Map<String, dynamic> _$$PartsTrainingInfoImplToJson(
        _$PartsTrainingInfoImpl instance) =>
    <String, dynamic>{
      'partsId': instance.partsId,
      'partsTrainingId': instance.partsTrainingId,
      'trainingName': instance.trainingName,
      'maxRm': instance.maxRm,
    };
