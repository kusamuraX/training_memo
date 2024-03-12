import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_model.freezed.dart';

@freezed
class EventModel with _$EventModel {
  const factory EventModel({required int partsId, required String partsName, required Map<String, List> trainingMap}) = _EventModel;
}
