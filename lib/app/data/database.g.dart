// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $BodyPartsInfoTable extends BodyPartsInfo
    with TableInfo<$BodyPartsInfoTable, BodyPartsInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BodyPartsInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _partsIdMeta =
      const VerificationMeta('partsId');
  @override
  late final GeneratedColumn<int> partsId = GeneratedColumn<int>(
      'parts_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _partsNameMeta =
      const VerificationMeta('partsName');
  @override
  late final GeneratedColumn<String> partsName = GeneratedColumn<String>(
      'parts_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [partsId, partsName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'body_parts_info';
  @override
  VerificationContext validateIntegrity(Insertable<BodyPartsInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('parts_id')) {
      context.handle(_partsIdMeta,
          partsId.isAcceptableOrUnknown(data['parts_id']!, _partsIdMeta));
    }
    if (data.containsKey('parts_name')) {
      context.handle(_partsNameMeta,
          partsName.isAcceptableOrUnknown(data['parts_name']!, _partsNameMeta));
    } else if (isInserting) {
      context.missing(_partsNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {partsId};
  @override
  BodyPartsInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BodyPartsInfoData(
      partsId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parts_id'])!,
      partsName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parts_name'])!,
    );
  }

  @override
  $BodyPartsInfoTable createAlias(String alias) {
    return $BodyPartsInfoTable(attachedDatabase, alias);
  }
}

class BodyPartsInfoData extends DataClass
    implements Insertable<BodyPartsInfoData> {
  final int partsId;
  final String partsName;
  const BodyPartsInfoData({required this.partsId, required this.partsName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['parts_id'] = Variable<int>(partsId);
    map['parts_name'] = Variable<String>(partsName);
    return map;
  }

  BodyPartsInfoCompanion toCompanion(bool nullToAbsent) {
    return BodyPartsInfoCompanion(
      partsId: Value(partsId),
      partsName: Value(partsName),
    );
  }

  factory BodyPartsInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BodyPartsInfoData(
      partsId: serializer.fromJson<int>(json['partsId']),
      partsName: serializer.fromJson<String>(json['partsName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'partsId': serializer.toJson<int>(partsId),
      'partsName': serializer.toJson<String>(partsName),
    };
  }

  BodyPartsInfoData copyWith({int? partsId, String? partsName}) =>
      BodyPartsInfoData(
        partsId: partsId ?? this.partsId,
        partsName: partsName ?? this.partsName,
      );
  @override
  String toString() {
    return (StringBuffer('BodyPartsInfoData(')
          ..write('partsId: $partsId, ')
          ..write('partsName: $partsName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(partsId, partsName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BodyPartsInfoData &&
          other.partsId == this.partsId &&
          other.partsName == this.partsName);
}

class BodyPartsInfoCompanion extends UpdateCompanion<BodyPartsInfoData> {
  final Value<int> partsId;
  final Value<String> partsName;
  const BodyPartsInfoCompanion({
    this.partsId = const Value.absent(),
    this.partsName = const Value.absent(),
  });
  BodyPartsInfoCompanion.insert({
    this.partsId = const Value.absent(),
    required String partsName,
  }) : partsName = Value(partsName);
  static Insertable<BodyPartsInfoData> custom({
    Expression<int>? partsId,
    Expression<String>? partsName,
  }) {
    return RawValuesInsertable({
      if (partsId != null) 'parts_id': partsId,
      if (partsName != null) 'parts_name': partsName,
    });
  }

  BodyPartsInfoCompanion copyWith(
      {Value<int>? partsId, Value<String>? partsName}) {
    return BodyPartsInfoCompanion(
      partsId: partsId ?? this.partsId,
      partsName: partsName ?? this.partsName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (partsId.present) {
      map['parts_id'] = Variable<int>(partsId.value);
    }
    if (partsName.present) {
      map['parts_name'] = Variable<String>(partsName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BodyPartsInfoCompanion(')
          ..write('partsId: $partsId, ')
          ..write('partsName: $partsName')
          ..write(')'))
        .toString();
  }
}

class $PartsTrainingInfoTable extends PartsTrainingInfo
    with TableInfo<$PartsTrainingInfoTable, PartsTrainingInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartsTrainingInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bodyPartsInfoMeta =
      const VerificationMeta('bodyPartsInfo');
  @override
  late final GeneratedColumn<int> bodyPartsInfo = GeneratedColumn<int>(
      'body_parts_info', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES body_parts_info (parts_id)'));
  static const VerificationMeta _partsTrainingIdMeta =
      const VerificationMeta('partsTrainingId');
  @override
  late final GeneratedColumn<int> partsTrainingId = GeneratedColumn<int>(
      'parts_training_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _trainingNameMeta =
      const VerificationMeta('trainingName');
  @override
  late final GeneratedColumn<String> trainingName = GeneratedColumn<String>(
      'training_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [bodyPartsInfo, partsTrainingId, trainingName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parts_training_info';
  @override
  VerificationContext validateIntegrity(
      Insertable<PartsTrainingInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('body_parts_info')) {
      context.handle(
          _bodyPartsInfoMeta,
          bodyPartsInfo.isAcceptableOrUnknown(
              data['body_parts_info']!, _bodyPartsInfoMeta));
    } else if (isInserting) {
      context.missing(_bodyPartsInfoMeta);
    }
    if (data.containsKey('parts_training_id')) {
      context.handle(
          _partsTrainingIdMeta,
          partsTrainingId.isAcceptableOrUnknown(
              data['parts_training_id']!, _partsTrainingIdMeta));
    }
    if (data.containsKey('training_name')) {
      context.handle(
          _trainingNameMeta,
          trainingName.isAcceptableOrUnknown(
              data['training_name']!, _trainingNameMeta));
    } else if (isInserting) {
      context.missing(_trainingNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {partsTrainingId};
  @override
  PartsTrainingInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PartsTrainingInfoData(
      bodyPartsInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}body_parts_info'])!,
      partsTrainingId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parts_training_id'])!,
      trainingName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}training_name'])!,
    );
  }

  @override
  $PartsTrainingInfoTable createAlias(String alias) {
    return $PartsTrainingInfoTable(attachedDatabase, alias);
  }
}

class PartsTrainingInfoData extends DataClass
    implements Insertable<PartsTrainingInfoData> {
  final int bodyPartsInfo;
  final int partsTrainingId;
  final String trainingName;
  const PartsTrainingInfoData(
      {required this.bodyPartsInfo,
      required this.partsTrainingId,
      required this.trainingName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['body_parts_info'] = Variable<int>(bodyPartsInfo);
    map['parts_training_id'] = Variable<int>(partsTrainingId);
    map['training_name'] = Variable<String>(trainingName);
    return map;
  }

  PartsTrainingInfoCompanion toCompanion(bool nullToAbsent) {
    return PartsTrainingInfoCompanion(
      bodyPartsInfo: Value(bodyPartsInfo),
      partsTrainingId: Value(partsTrainingId),
      trainingName: Value(trainingName),
    );
  }

  factory PartsTrainingInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PartsTrainingInfoData(
      bodyPartsInfo: serializer.fromJson<int>(json['bodyPartsInfo']),
      partsTrainingId: serializer.fromJson<int>(json['partsTrainingId']),
      trainingName: serializer.fromJson<String>(json['trainingName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bodyPartsInfo': serializer.toJson<int>(bodyPartsInfo),
      'partsTrainingId': serializer.toJson<int>(partsTrainingId),
      'trainingName': serializer.toJson<String>(trainingName),
    };
  }

  PartsTrainingInfoData copyWith(
          {int? bodyPartsInfo, int? partsTrainingId, String? trainingName}) =>
      PartsTrainingInfoData(
        bodyPartsInfo: bodyPartsInfo ?? this.bodyPartsInfo,
        partsTrainingId: partsTrainingId ?? this.partsTrainingId,
        trainingName: trainingName ?? this.trainingName,
      );
  @override
  String toString() {
    return (StringBuffer('PartsTrainingInfoData(')
          ..write('bodyPartsInfo: $bodyPartsInfo, ')
          ..write('partsTrainingId: $partsTrainingId, ')
          ..write('trainingName: $trainingName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(bodyPartsInfo, partsTrainingId, trainingName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartsTrainingInfoData &&
          other.bodyPartsInfo == this.bodyPartsInfo &&
          other.partsTrainingId == this.partsTrainingId &&
          other.trainingName == this.trainingName);
}

class PartsTrainingInfoCompanion
    extends UpdateCompanion<PartsTrainingInfoData> {
  final Value<int> bodyPartsInfo;
  final Value<int> partsTrainingId;
  final Value<String> trainingName;
  const PartsTrainingInfoCompanion({
    this.bodyPartsInfo = const Value.absent(),
    this.partsTrainingId = const Value.absent(),
    this.trainingName = const Value.absent(),
  });
  PartsTrainingInfoCompanion.insert({
    required int bodyPartsInfo,
    this.partsTrainingId = const Value.absent(),
    required String trainingName,
  })  : bodyPartsInfo = Value(bodyPartsInfo),
        trainingName = Value(trainingName);
  static Insertable<PartsTrainingInfoData> custom({
    Expression<int>? bodyPartsInfo,
    Expression<int>? partsTrainingId,
    Expression<String>? trainingName,
  }) {
    return RawValuesInsertable({
      if (bodyPartsInfo != null) 'body_parts_info': bodyPartsInfo,
      if (partsTrainingId != null) 'parts_training_id': partsTrainingId,
      if (trainingName != null) 'training_name': trainingName,
    });
  }

  PartsTrainingInfoCompanion copyWith(
      {Value<int>? bodyPartsInfo,
      Value<int>? partsTrainingId,
      Value<String>? trainingName}) {
    return PartsTrainingInfoCompanion(
      bodyPartsInfo: bodyPartsInfo ?? this.bodyPartsInfo,
      partsTrainingId: partsTrainingId ?? this.partsTrainingId,
      trainingName: trainingName ?? this.trainingName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bodyPartsInfo.present) {
      map['body_parts_info'] = Variable<int>(bodyPartsInfo.value);
    }
    if (partsTrainingId.present) {
      map['parts_training_id'] = Variable<int>(partsTrainingId.value);
    }
    if (trainingName.present) {
      map['training_name'] = Variable<String>(trainingName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartsTrainingInfoCompanion(')
          ..write('bodyPartsInfo: $bodyPartsInfo, ')
          ..write('partsTrainingId: $partsTrainingId, ')
          ..write('trainingName: $trainingName')
          ..write(')'))
        .toString();
  }
}

class $TrainingDataInfoTable extends TrainingDataInfo
    with TableInfo<$TrainingDataInfoTable, TrainingDataInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrainingDataInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _bodyPartsInfoMeta =
      const VerificationMeta('bodyPartsInfo');
  @override
  late final GeneratedColumn<int> bodyPartsInfo = GeneratedColumn<int>(
      'body_parts_info', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES body_parts_info (parts_id)'));
  static const VerificationMeta _partsTrainingInfoMeta =
      const VerificationMeta('partsTrainingInfo');
  @override
  late final GeneratedColumn<int> partsTrainingInfo = GeneratedColumn<int>(
      'parts_training_info', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES parts_training_info (parts_training_id)'));
  static const VerificationMeta _trainingIdMeta =
      const VerificationMeta('trainingId');
  @override
  late final GeneratedColumn<int> trainingId = GeneratedColumn<int>(
      'training_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _trainingDateMeta =
      const VerificationMeta('trainingDate');
  @override
  late final GeneratedColumn<DateTime> trainingDate = GeneratedColumn<DateTime>(
      'training_date', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
      'weight', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _repMeta = const VerificationMeta('rep');
  @override
  late final GeneratedColumn<int> rep = GeneratedColumn<int>(
      'rep', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _rmMeta = const VerificationMeta('rm');
  @override
  late final GeneratedColumn<int> rm = GeneratedColumn<int>(
      'rm', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _memoMeta = const VerificationMeta('memo');
  @override
  late final GeneratedColumn<String> memo = GeneratedColumn<String>(
      'memo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        bodyPartsInfo,
        partsTrainingInfo,
        trainingId,
        trainingDate,
        weight,
        rep,
        rm,
        memo
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'training_data_info';
  @override
  VerificationContext validateIntegrity(
      Insertable<TrainingDataInfoData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('body_parts_info')) {
      context.handle(
          _bodyPartsInfoMeta,
          bodyPartsInfo.isAcceptableOrUnknown(
              data['body_parts_info']!, _bodyPartsInfoMeta));
    } else if (isInserting) {
      context.missing(_bodyPartsInfoMeta);
    }
    if (data.containsKey('parts_training_info')) {
      context.handle(
          _partsTrainingInfoMeta,
          partsTrainingInfo.isAcceptableOrUnknown(
              data['parts_training_info']!, _partsTrainingInfoMeta));
    } else if (isInserting) {
      context.missing(_partsTrainingInfoMeta);
    }
    if (data.containsKey('training_id')) {
      context.handle(
          _trainingIdMeta,
          trainingId.isAcceptableOrUnknown(
              data['training_id']!, _trainingIdMeta));
    }
    if (data.containsKey('training_date')) {
      context.handle(
          _trainingDateMeta,
          trainingDate.isAcceptableOrUnknown(
              data['training_date']!, _trainingDateMeta));
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    }
    if (data.containsKey('rep')) {
      context.handle(
          _repMeta, rep.isAcceptableOrUnknown(data['rep']!, _repMeta));
    }
    if (data.containsKey('rm')) {
      context.handle(_rmMeta, rm.isAcceptableOrUnknown(data['rm']!, _rmMeta));
    }
    if (data.containsKey('memo')) {
      context.handle(
          _memoMeta, memo.isAcceptableOrUnknown(data['memo']!, _memoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {trainingId};
  @override
  TrainingDataInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TrainingDataInfoData(
      bodyPartsInfo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}body_parts_info'])!,
      partsTrainingInfo: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}parts_training_info'])!,
      trainingId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}training_id'])!,
      trainingDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}training_date'])!,
      weight: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}weight']),
      rep: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rep']),
      rm: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rm']),
      memo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}memo']),
    );
  }

  @override
  $TrainingDataInfoTable createAlias(String alias) {
    return $TrainingDataInfoTable(attachedDatabase, alias);
  }
}

class TrainingDataInfoData extends DataClass
    implements Insertable<TrainingDataInfoData> {
  final int bodyPartsInfo;
  final int partsTrainingInfo;
  final int trainingId;
  final DateTime trainingDate;
  final double? weight;
  final int? rep;
  final int? rm;
  final String? memo;
  const TrainingDataInfoData(
      {required this.bodyPartsInfo,
      required this.partsTrainingInfo,
      required this.trainingId,
      required this.trainingDate,
      this.weight,
      this.rep,
      this.rm,
      this.memo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['body_parts_info'] = Variable<int>(bodyPartsInfo);
    map['parts_training_info'] = Variable<int>(partsTrainingInfo);
    map['training_id'] = Variable<int>(trainingId);
    map['training_date'] = Variable<DateTime>(trainingDate);
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<double>(weight);
    }
    if (!nullToAbsent || rep != null) {
      map['rep'] = Variable<int>(rep);
    }
    if (!nullToAbsent || rm != null) {
      map['rm'] = Variable<int>(rm);
    }
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    return map;
  }

  TrainingDataInfoCompanion toCompanion(bool nullToAbsent) {
    return TrainingDataInfoCompanion(
      bodyPartsInfo: Value(bodyPartsInfo),
      partsTrainingInfo: Value(partsTrainingInfo),
      trainingId: Value(trainingId),
      trainingDate: Value(trainingDate),
      weight:
          weight == null && nullToAbsent ? const Value.absent() : Value(weight),
      rep: rep == null && nullToAbsent ? const Value.absent() : Value(rep),
      rm: rm == null && nullToAbsent ? const Value.absent() : Value(rm),
      memo: memo == null && nullToAbsent ? const Value.absent() : Value(memo),
    );
  }

  factory TrainingDataInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TrainingDataInfoData(
      bodyPartsInfo: serializer.fromJson<int>(json['bodyPartsInfo']),
      partsTrainingInfo: serializer.fromJson<int>(json['partsTrainingInfo']),
      trainingId: serializer.fromJson<int>(json['trainingId']),
      trainingDate: serializer.fromJson<DateTime>(json['trainingDate']),
      weight: serializer.fromJson<double?>(json['weight']),
      rep: serializer.fromJson<int?>(json['rep']),
      rm: serializer.fromJson<int?>(json['rm']),
      memo: serializer.fromJson<String?>(json['memo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'bodyPartsInfo': serializer.toJson<int>(bodyPartsInfo),
      'partsTrainingInfo': serializer.toJson<int>(partsTrainingInfo),
      'trainingId': serializer.toJson<int>(trainingId),
      'trainingDate': serializer.toJson<DateTime>(trainingDate),
      'weight': serializer.toJson<double?>(weight),
      'rep': serializer.toJson<int?>(rep),
      'rm': serializer.toJson<int?>(rm),
      'memo': serializer.toJson<String?>(memo),
    };
  }

  TrainingDataInfoData copyWith(
          {int? bodyPartsInfo,
          int? partsTrainingInfo,
          int? trainingId,
          DateTime? trainingDate,
          Value<double?> weight = const Value.absent(),
          Value<int?> rep = const Value.absent(),
          Value<int?> rm = const Value.absent(),
          Value<String?> memo = const Value.absent()}) =>
      TrainingDataInfoData(
        bodyPartsInfo: bodyPartsInfo ?? this.bodyPartsInfo,
        partsTrainingInfo: partsTrainingInfo ?? this.partsTrainingInfo,
        trainingId: trainingId ?? this.trainingId,
        trainingDate: trainingDate ?? this.trainingDate,
        weight: weight.present ? weight.value : this.weight,
        rep: rep.present ? rep.value : this.rep,
        rm: rm.present ? rm.value : this.rm,
        memo: memo.present ? memo.value : this.memo,
      );
  @override
  String toString() {
    return (StringBuffer('TrainingDataInfoData(')
          ..write('bodyPartsInfo: $bodyPartsInfo, ')
          ..write('partsTrainingInfo: $partsTrainingInfo, ')
          ..write('trainingId: $trainingId, ')
          ..write('trainingDate: $trainingDate, ')
          ..write('weight: $weight, ')
          ..write('rep: $rep, ')
          ..write('rm: $rm, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(bodyPartsInfo, partsTrainingInfo, trainingId,
      trainingDate, weight, rep, rm, memo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TrainingDataInfoData &&
          other.bodyPartsInfo == this.bodyPartsInfo &&
          other.partsTrainingInfo == this.partsTrainingInfo &&
          other.trainingId == this.trainingId &&
          other.trainingDate == this.trainingDate &&
          other.weight == this.weight &&
          other.rep == this.rep &&
          other.rm == this.rm &&
          other.memo == this.memo);
}

class TrainingDataInfoCompanion extends UpdateCompanion<TrainingDataInfoData> {
  final Value<int> bodyPartsInfo;
  final Value<int> partsTrainingInfo;
  final Value<int> trainingId;
  final Value<DateTime> trainingDate;
  final Value<double?> weight;
  final Value<int?> rep;
  final Value<int?> rm;
  final Value<String?> memo;
  const TrainingDataInfoCompanion({
    this.bodyPartsInfo = const Value.absent(),
    this.partsTrainingInfo = const Value.absent(),
    this.trainingId = const Value.absent(),
    this.trainingDate = const Value.absent(),
    this.weight = const Value.absent(),
    this.rep = const Value.absent(),
    this.rm = const Value.absent(),
    this.memo = const Value.absent(),
  });
  TrainingDataInfoCompanion.insert({
    required int bodyPartsInfo,
    required int partsTrainingInfo,
    this.trainingId = const Value.absent(),
    this.trainingDate = const Value.absent(),
    this.weight = const Value.absent(),
    this.rep = const Value.absent(),
    this.rm = const Value.absent(),
    this.memo = const Value.absent(),
  })  : bodyPartsInfo = Value(bodyPartsInfo),
        partsTrainingInfo = Value(partsTrainingInfo);
  static Insertable<TrainingDataInfoData> custom({
    Expression<int>? bodyPartsInfo,
    Expression<int>? partsTrainingInfo,
    Expression<int>? trainingId,
    Expression<DateTime>? trainingDate,
    Expression<double>? weight,
    Expression<int>? rep,
    Expression<int>? rm,
    Expression<String>? memo,
  }) {
    return RawValuesInsertable({
      if (bodyPartsInfo != null) 'body_parts_info': bodyPartsInfo,
      if (partsTrainingInfo != null) 'parts_training_info': partsTrainingInfo,
      if (trainingId != null) 'training_id': trainingId,
      if (trainingDate != null) 'training_date': trainingDate,
      if (weight != null) 'weight': weight,
      if (rep != null) 'rep': rep,
      if (rm != null) 'rm': rm,
      if (memo != null) 'memo': memo,
    });
  }

  TrainingDataInfoCompanion copyWith(
      {Value<int>? bodyPartsInfo,
      Value<int>? partsTrainingInfo,
      Value<int>? trainingId,
      Value<DateTime>? trainingDate,
      Value<double?>? weight,
      Value<int?>? rep,
      Value<int?>? rm,
      Value<String?>? memo}) {
    return TrainingDataInfoCompanion(
      bodyPartsInfo: bodyPartsInfo ?? this.bodyPartsInfo,
      partsTrainingInfo: partsTrainingInfo ?? this.partsTrainingInfo,
      trainingId: trainingId ?? this.trainingId,
      trainingDate: trainingDate ?? this.trainingDate,
      weight: weight ?? this.weight,
      rep: rep ?? this.rep,
      rm: rm ?? this.rm,
      memo: memo ?? this.memo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (bodyPartsInfo.present) {
      map['body_parts_info'] = Variable<int>(bodyPartsInfo.value);
    }
    if (partsTrainingInfo.present) {
      map['parts_training_info'] = Variable<int>(partsTrainingInfo.value);
    }
    if (trainingId.present) {
      map['training_id'] = Variable<int>(trainingId.value);
    }
    if (trainingDate.present) {
      map['training_date'] = Variable<DateTime>(trainingDate.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (rep.present) {
      map['rep'] = Variable<int>(rep.value);
    }
    if (rm.present) {
      map['rm'] = Variable<int>(rm.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrainingDataInfoCompanion(')
          ..write('bodyPartsInfo: $bodyPartsInfo, ')
          ..write('partsTrainingInfo: $partsTrainingInfo, ')
          ..write('trainingId: $trainingId, ')
          ..write('trainingDate: $trainingDate, ')
          ..write('weight: $weight, ')
          ..write('rep: $rep, ')
          ..write('rm: $rm, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDataBase extends GeneratedDatabase {
  _$AppDataBase(QueryExecutor e) : super(e);
  late final $BodyPartsInfoTable bodyPartsInfo = $BodyPartsInfoTable(this);
  late final $PartsTrainingInfoTable partsTrainingInfo =
      $PartsTrainingInfoTable(this);
  late final $TrainingDataInfoTable trainingDataInfo =
      $TrainingDataInfoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [bodyPartsInfo, partsTrainingInfo, trainingDataInfo];
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDataBaseHash() => r'16fa7fb2c837d14f4ee63b13fd2a871d72ea94e9';

/// See also [appDataBase].
@ProviderFor(appDataBase)
final appDataBaseProvider = AutoDisposeProvider<AppDataBase>.internal(
  appDataBase,
  name: r'appDataBaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDataBaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppDataBaseRef = AutoDisposeProviderRef<AppDataBase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
