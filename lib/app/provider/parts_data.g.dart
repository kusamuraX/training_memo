// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parts_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$partsDataHash() => r'e76ba008fe47dd1cbbac30d76d828534ea04a093';

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

abstract class _$PartsData
    extends BuildlessAutoDisposeStreamNotifier<List<BodyPartsInfoData>> {
  late final AppDataBase database;

  Stream<List<BodyPartsInfoData>> build(
    AppDataBase database,
  );
}

/// See also [PartsData].
@ProviderFor(PartsData)
const partsDataProvider = PartsDataFamily();

/// See also [PartsData].
class PartsDataFamily extends Family<AsyncValue<List<BodyPartsInfoData>>> {
  /// See also [PartsData].
  const PartsDataFamily();

  /// See also [PartsData].
  PartsDataProvider call(
    AppDataBase database,
  ) {
    return PartsDataProvider(
      database,
    );
  }

  @override
  PartsDataProvider getProviderOverride(
    covariant PartsDataProvider provider,
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
  String? get name => r'partsDataProvider';
}

/// See also [PartsData].
class PartsDataProvider extends AutoDisposeStreamNotifierProviderImpl<PartsData,
    List<BodyPartsInfoData>> {
  /// See also [PartsData].
  PartsDataProvider(
    AppDataBase database,
  ) : this._internal(
          () => PartsData()..database = database,
          from: partsDataProvider,
          name: r'partsDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$partsDataHash,
          dependencies: PartsDataFamily._dependencies,
          allTransitiveDependencies: PartsDataFamily._allTransitiveDependencies,
          database: database,
        );

  PartsDataProvider._internal(
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
  Stream<List<BodyPartsInfoData>> runNotifierBuild(
    covariant PartsData notifier,
  ) {
    return notifier.build(
      database,
    );
  }

  @override
  Override overrideWith(PartsData Function() create) {
    return ProviderOverride(
      origin: this,
      override: PartsDataProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<PartsData, List<BodyPartsInfoData>>
      createElement() {
    return _PartsDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PartsDataProvider && other.database == database;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, database.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PartsDataRef
    on AutoDisposeStreamNotifierProviderRef<List<BodyPartsInfoData>> {
  /// The parameter `database` of this provider.
  AppDataBase get database;
}

class _PartsDataProviderElement
    extends AutoDisposeStreamNotifierProviderElement<PartsData,
        List<BodyPartsInfoData>> with PartsDataRef {
  _PartsDataProviderElement(super.provider);

  @override
  AppDataBase get database => (origin as PartsDataProvider).database;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
