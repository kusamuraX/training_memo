// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_info_repository.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrainingInfoImpl _$$TrainingInfoImplFromJson(Map<String, dynamic> json) =>
    _$TrainingInfoImpl(
      partsId: json['partsId'] as int,
      partsTrainingId: json['partsTrainingId'] as int,
      trainingId: json['trainingId'] as int,
      date: json['date'] as String,
      weight: (json['weight'] as num?)?.toDouble(),
      count: json['count'] as int?,
      rm: json['rm'] as int?,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$$TrainingInfoImplToJson(_$TrainingInfoImpl instance) =>
    <String, dynamic>{
      'partsId': instance.partsId,
      'partsTrainingId': instance.partsTrainingId,
      'trainingId': instance.trainingId,
      'date': instance.date,
      'weight': instance.weight,
      'count': instance.count,
      'rm': instance.rm,
      'memo': instance.memo,
    };
