// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_history_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trainingHistoryDataHash() =>
    r'70b7ec11007ef7f4d529418d0194caeeb4d909b8';

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

abstract class _$TrainingHistoryData
    extends BuildlessAutoDisposeNotifier<HistoryDataViewModel> {
  late final AppDataBase database;

  HistoryDataViewModel build(
    AppDataBase database,
  );
}

/// See also [TrainingHistoryData].
@ProviderFor(TrainingHistoryData)
const trainingHistoryDataProvider = TrainingHistoryDataFamily();

/// See also [TrainingHistoryData].
class TrainingHistoryDataFamily extends Family<HistoryDataViewModel> {
  /// See also [TrainingHistoryData].
  const TrainingHistoryDataFamily();

  /// See also [TrainingHistoryData].
  TrainingHistoryDataProvider call(
    AppDataBase database,
  ) {
    return TrainingHistoryDataProvider(
      database,
    );
  }

  @override
  TrainingHistoryDataProvider getProviderOverride(
    covariant TrainingHistoryDataProvider provider,
  ) {
    return call(
      provider.database,
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
  String? get name => r'trainingHistoryDataProvider';
}

/// See also [TrainingHistoryData].
class TrainingHistoryDataProvider extends AutoDisposeNotifierProviderImpl<
    TrainingHistoryData, HistoryDataViewModel> {
  /// See also [TrainingHistoryData].
  TrainingHistoryDataProvider(
    AppDataBase database,
  ) : this._internal(
          () => TrainingHistoryData()..database = database,
          from: trainingHistoryDataProvider,
          name: r'trainingHistoryDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$trainingHistoryDataHash,
          dependencies: TrainingHistoryDataFamily._dependencies,
          allTransitiveDependencies:
              TrainingHistoryDataFamily._allTransitiveDependencies,
          database: database,
        );

  TrainingHistoryDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.database,
  }) : super.internal();

  final AppDataBase database;

  @override
  HistoryDataViewModel runNotifierBuild(
    covariant TrainingHistoryData notifier,
  ) {
    return notifier.build(
      database,
    );
  }

  @override
  Override overrideWith(TrainingHistoryData Function() create) {
    return ProviderOverride(
      origin: this,
      override: TrainingHistoryDataProvider._internal(
        () => create()..database = database,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        database: database,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TrainingHistoryData, HistoryDataViewModel>
      createElement() {
    return _TrainingHistoryDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TrainingHistoryDataProvider && other.database == database;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, database.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TrainingHistoryDataRef
    on AutoDisposeNotifierProviderRef<HistoryDataViewModel> {
  /// The parameter `database` of this provider.
  AppDataBase get database;
}

class _TrainingHistoryDataProviderElement
    extends AutoDisposeNotifierProviderElement<TrainingHistoryData,
        HistoryDataViewModel> with TrainingHistoryDataRef {
  _TrainingHistoryDataProviderElement(super.provider);

  @override
  AppDataBase get database => (origin as TrainingHistoryDataProvider).database;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
