// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_total_weight_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentTotalWeightDataHash() =>
    r'869765ae360467027b739321e4b5031163372507';

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

abstract class _$CurrentTotalWeightData
    extends BuildlessAutoDisposeStreamNotifier<double> {
  late final AppDataBase database;
  late final int partsId;
  late final int partsTrainingId;
  late final DateTime date;

  Stream<double> build(
    AppDataBase database,
    int partsId,
    int partsTrainingId,
    DateTime date,
  );
}

/// See also [CurrentTotalWeightData].
@ProviderFor(CurrentTotalWeightData)
const currentTotalWeightDataProvider = CurrentTotalWeightDataFamily();

/// See also [CurrentTotalWeightData].
class CurrentTotalWeightDataFamily extends Family<AsyncValue<double>> {
  /// See also [CurrentTotalWeightData].
  const CurrentTotalWeightDataFamily();

  /// See also [CurrentTotalWeightData].
  CurrentTotalWeightDataProvider call(
    AppDataBase database,
    int partsId,
    int partsTrainingId,
    DateTime date,
  ) {
    return CurrentTotalWeightDataProvider(
      database,
      partsId,
      partsTrainingId,
      date,
    );
  }

  @override
  CurrentTotalWeightDataProvider getProviderOverride(
    covariant CurrentTotalWeightDataProvider provider,
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
  String? get name => r'currentTotalWeightDataProvider';
}

/// See also [CurrentTotalWeightData].
class CurrentTotalWeightDataProvider
    extends AutoDisposeStreamNotifierProviderImpl<CurrentTotalWeightData,
        double> {
  /// See also [CurrentTotalWeightData].
  CurrentTotalWeightDataProvider(
    AppDataBase database,
    int partsId,
    int partsTrainingId,
    DateTime date,
  ) : this._internal(
          () => CurrentTotalWeightData()
            ..database = database
            ..partsId = partsId
            ..partsTrainingId = partsTrainingId
            ..date = date,
          from: currentTotalWeightDataProvider,
          name: r'currentTotalWeightDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentTotalWeightDataHash,
          dependencies: CurrentTotalWeightDataFamily._dependencies,
          allTransitiveDependencies:
              CurrentTotalWeightDataFamily._allTransitiveDependencies,
          database: database,
          partsId: partsId,
          partsTrainingId: partsTrainingId,
          date: date,
        );

  CurrentTotalWeightDataProvider._internal(
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
  Stream<double> runNotifierBuild(
    covariant CurrentTotalWeightData notifier,
  ) {
    return notifier.build(
      database,
      partsId,
      partsTrainingId,
      date,
    );
  }

  @override
  Override overrideWith(CurrentTotalWeightData Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentTotalWeightDataProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<CurrentTotalWeightData, double>
      createElement() {
    return _CurrentTotalWeightDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentTotalWeightDataProvider &&
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

mixin CurrentTotalWeightDataRef
    on AutoDisposeStreamNotifierProviderRef<double> {
  /// The parameter `database` of this provider.
  AppDataBase get database;

  /// The parameter `partsId` of this provider.
  int get partsId;

  /// The parameter `partsTrainingId` of this provider.
  int get partsTrainingId;

  /// The parameter `date` of this provider.
  DateTime get date;
}

class _CurrentTotalWeightDataProviderElement
    extends AutoDisposeStreamNotifierProviderElement<CurrentTotalWeightData,
        double> with CurrentTotalWeightDataRef {
  _CurrentTotalWeightDataProviderElement(super.provider);

  @override
  AppDataBase get database =>
      (origin as CurrentTotalWeightDataProvider).database;
  @override
  int get partsId => (origin as CurrentTotalWeightDataProvider).partsId;
  @override
  int get partsTrainingId =>
      (origin as CurrentTotalWeightDataProvider).partsTrainingId;
  @override
  DateTime get date => (origin as CurrentTotalWeightDataProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
