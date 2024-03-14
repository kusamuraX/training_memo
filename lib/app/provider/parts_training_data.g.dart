// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parts_training_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$partsTrainingDataHash() => r'67642e14f8451e9a908db3f2e82865c51990c567';

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

abstract class _$PartsTrainingData
    extends BuildlessAutoDisposeStreamNotifier<List<PartsTrainingInfoData>> {
  late final AppDataBase database;
  late final int partsId;

  Stream<List<PartsTrainingInfoData>> build(
    AppDataBase database,
    int partsId,
  );
}

/// See also [PartsTrainingData].
@ProviderFor(PartsTrainingData)
const partsTrainingDataProvider = PartsTrainingDataFamily();

/// See also [PartsTrainingData].
class PartsTrainingDataFamily
    extends Family<AsyncValue<List<PartsTrainingInfoData>>> {
  /// See also [PartsTrainingData].
  const PartsTrainingDataFamily();

  /// See also [PartsTrainingData].
  PartsTrainingDataProvider call(
    AppDataBase database,
    int partsId,
  ) {
    return PartsTrainingDataProvider(
      database,
      partsId,
    );
  }

  @override
  PartsTrainingDataProvider getProviderOverride(
    covariant PartsTrainingDataProvider provider,
  ) {
    return call(
      provider.database,
      provider.partsId,
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
  String? get name => r'partsTrainingDataProvider';
}

/// See also [PartsTrainingData].
class PartsTrainingDataProvider extends AutoDisposeStreamNotifierProviderImpl<
    PartsTrainingData, List<PartsTrainingInfoData>> {
  /// See also [PartsTrainingData].
  PartsTrainingDataProvider(
    AppDataBase database,
    int partsId,
  ) : this._internal(
          () => PartsTrainingData()
            ..database = database
            ..partsId = partsId,
          from: partsTrainingDataProvider,
          name: r'partsTrainingDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$partsTrainingDataHash,
          dependencies: PartsTrainingDataFamily._dependencies,
          allTransitiveDependencies:
              PartsTrainingDataFamily._allTransitiveDependencies,
          database: database,
          partsId: partsId,
        );

  PartsTrainingDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.database,
    required this.partsId,
  }) : super.internal();

  final AppDataBase database;
  final int partsId;

  @override
  Stream<List<PartsTrainingInfoData>> runNotifierBuild(
    covariant PartsTrainingData notifier,
  ) {
    return notifier.build(
      database,
      partsId,
    );
  }

  @override
  Override overrideWith(PartsTrainingData Function() create) {
    return ProviderOverride(
      origin: this,
      override: PartsTrainingDataProvider._internal(
        () => create()
          ..database = database
          ..partsId = partsId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        database: database,
        partsId: partsId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<PartsTrainingData,
      List<PartsTrainingInfoData>> createElement() {
    return _PartsTrainingDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PartsTrainingDataProvider &&
        other.database == database &&
        other.partsId == partsId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, database.hashCode);
    hash = _SystemHash.combine(hash, partsId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PartsTrainingDataRef
    on AutoDisposeStreamNotifierProviderRef<List<PartsTrainingInfoData>> {
  /// The parameter `database` of this provider.
  AppDataBase get database;

  /// The parameter `partsId` of this provider.
  int get partsId;
}

class _PartsTrainingDataProviderElement
    extends AutoDisposeStreamNotifierProviderElement<PartsTrainingData,
        List<PartsTrainingInfoData>> with PartsTrainingDataRef {
  _PartsTrainingDataProviderElement(super.provider);

  @override
  AppDataBase get database => (origin as PartsTrainingDataProvider).database;
  @override
  int get partsId => (origin as PartsTrainingDataProvider).partsId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
