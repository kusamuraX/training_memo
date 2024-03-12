// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trainingDataHash() => r'0c0e3088ef63bd9d5524c1986feb994e9a891755';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TrainingData
    extends BuildlessAutoDisposeStreamNotifier<List<TrainingInfo>> {
  late final AppDataBase database;
  late final int partsId;
  late final int partsTrainingId;
  late final DateTime date;

  Stream<List<TrainingInfo>> build(
    AppDataBase database,
    int partsId,
    int partsTrainingId,
    DateTime date,
  );
}

/// See also [TrainingData].
@ProviderFor(TrainingData)
const trainingDataProvider = TrainingDataFamily();

/// See also [TrainingData].
class TrainingDataFamily extends Family<AsyncValue<List<TrainingInfo>>> {
  /// See also [TrainingData].
  const TrainingDataFamily();

  /// See also [TrainingData].
  TrainingDataProvider call(
    AppDataBase database,
    int partsId,
    int partsTrainingId,
    DateTime date,
  ) {
    return TrainingDataProvider(
      database,
      partsId,
      partsTrainingId,
      date,
    );
  }

  @override
  TrainingDataProvider getProviderOverride(
    covariant TrainingDataProvider provider,
  ) {
    return call(
      provider.database,
      provider.partsId,
      provider.partsTrainingId,
      provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'trainingDataProvider';
}

/// See also [TrainingData].
class TrainingDataProvider extends AutoDisposeStreamNotifierProviderImpl<
    TrainingData, List<TrainingInfo>> {
  /// See also [TrainingData].
  TrainingDataProvider(
    AppDataBase database,
    int partsId,
    int partsTrainingId,
    DateTime date,
  ) : this._internal(
          () => TrainingData()
            ..database = database
            ..partsId = partsId
            ..partsTrainingId = partsTrainingId
            ..date = date,
          from: trainingDataProvider,
          name: r'trainingDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trainingDataHash,
          dependencies: TrainingDataFamily._dependencies,
          allTransitiveDependencies:
              TrainingDataFamily._allTransitiveDependencies,
          database: database,
          partsId: partsId,
          partsTrainingId: partsTrainingId,
          date: date,
        );

  TrainingDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.database,
    required this.partsId,
    required this.partsTrainingId,
    required this.date,
  }) : super.internal();

  final AppDataBase database;
  final int partsId;
  final int partsTrainingId;
  final DateTime date;

  @override
  Stream<List<TrainingInfo>> runNotifierBuild(
    covariant TrainingData notifier,
  ) {
    return notifier.build(
      database,
      partsId,
      partsTrainingId,
      date,
    );
  }

  @override
  Override overrideWith(TrainingData Function() create) {
    return ProviderOverride(
      origin: this,
      override: TrainingDataProvider._internal(
        () => create()
          ..database = database
          ..partsId = partsId
          ..partsTrainingId = partsTrainingId
          ..date = date,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        database: database,
        partsId: partsId,
        partsTrainingId: partsTrainingId,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<TrainingData, List<TrainingInfo>>
      createElement() {
    return _TrainingDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrainingDataProvider &&
        other.database == database &&
        other.partsId == partsId &&
        other.partsTrainingId == partsTrainingId &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, database.hashCode);
    hash = _SystemHash.combine(hash, partsId.hashCode);
    hash = _SystemHash.combine(hash, partsTrainingId.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TrainingDataRef
    on AutoDisposeStreamNotifierProviderRef<List<TrainingInfo>> {
  /// The parameter `database` of this provider.
  AppDataBase get database;

  /// The parameter `partsId` of this provider.
  int get partsId;

  /// The parameter `partsTrainingId` of this provider.
  int get partsTrainingId;

  /// The parameter `date` of this provider.
  DateTime get date;
}

class _TrainingDataProviderElement
    extends AutoDisposeStreamNotifierProviderElement<TrainingData,
        List<TrainingInfo>> with TrainingDataRef {
  _TrainingDataProviderElement(super.provider);

  @override
  AppDataBase get database => (origin as TrainingDataProvider).database;
  @override
  int get partsId => (origin as TrainingDataProvider).partsId;
  @override
  int get partsTrainingId => (origin as TrainingDataProvider).partsTrainingId;
  @override
  DateTime get date => (origin as TrainingDataProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
