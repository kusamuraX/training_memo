// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_info_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrainingInfoImpl _$$TrainingInfoImplFromJson(Map<String, dynamic> json) =>
    _$TrainingInfoImpl(
      partsId: (json['partsId'] as num).toInt(),
      partsTrainingId: (json['partsTrainingId'] as num).toInt(),
      trainingId: (json['trainingId'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      weight: (json['weight'] as num?)?.toDouble(),
      count: (json['count'] as num?)?.toInt(),
      rm: (json['rm'] as num?)?.toInt(),
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$$TrainingInfoImplToJson(_$TrainingInfoImpl instance) =>
    <String, dynamic>{
      'partsId': instance.partsId,
      'partsTrainingId': instance.partsTrainingId,
      'trainingId': instance.trainingId,
      'date': instance.date.toIso8601String(),
      'weight': instance.weight,
      'count': instance.count,
      'rm': instance.rm,
      'memo': instance.memo,
    };
