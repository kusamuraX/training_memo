// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parts_training_menu.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$partsTrainingMenuListHash() =>
    r'd05bc84427c03fa3913ca4200c3d22f711955161';

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

/// See also [partsTrainingMenuList].
@ProviderFor(partsTrainingMenuList)
const partsTrainingMenuListProvider = PartsTrainingMenuListFamily();

/// See also [partsTrainingMenuList].
class PartsTrainingMenuListFamily
    extends Family<AsyncValue<List<PartsTrainingMenuInfo>>> {
  /// See also [partsTrainingMenuList].
  const PartsTrainingMenuListFamily();

  /// See also [partsTrainingMenuList].
  PartsTrainingMenuListProvider call(
    AppDataBase database,
    int partsId,
  ) {
    return PartsTrainingMenuListProvider(
      database,
      partsId,
    );
  }

  @override
  PartsTrainingMenuListProvider getProviderOverride(
    covariant PartsTrainingMenuListProvider provider,
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
  String? get name => r'partsTrainingMenuListProvider';
}

/// See also [partsTrainingMenuList].
class PartsTrainingMenuListProvider
    extends AutoDisposeStreamProvider<List<PartsTrainingMenuInfo>> {
  /// See also [partsTrainingMenuList].
  PartsTrainingMenuListProvider(
    AppDataBase database,
    int partsId,
  ) : this._internal(
          (ref) => partsTrainingMenuList(
            ref as PartsTrainingMenuListRef,
            database,
            partsId,
          ),
          from: partsTrainingMenuListProvider,
          name: r'partsTrainingMenuListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$partsTrainingMenuListHash,
          dependencies: PartsTrainingMenuListFamily._dependencies,
          allTransitiveDependencies:
              PartsTrainingMenuListFamily._allTransitiveDependencies,
          database: database,
          partsId: partsId,
        );

  PartsTrainingMenuListProvider._internal(
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
  Override overrideWith(
    Stream<List<PartsTrainingMenuInfo>> Function(
            PartsTrainingMenuListRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PartsTrainingMenuListProvider._internal(
        (ref) => create(ref as PartsTrainingMenuListRef),
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
  AutoDisposeStreamProviderElement<List<PartsTrainingMenuInfo>>
      createElement() {
    return _PartsTrainingMenuListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PartsTrainingMenuListProvider &&
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

mixin PartsTrainingMenuListRef
    on AutoDisposeStreamProviderRef<List<PartsTrainingMenuInfo>> {
  /// The parameter `database` of this provider.
  AppDataBase get database;

  /// The parameter `partsId` of this provider.
  int get partsId;
}

class _PartsTrainingMenuListProviderElement
    extends AutoDisposeStreamProviderElement<List<PartsTrainingMenuInfo>>
    with PartsTrainingMenuListRef {
  _PartsTrainingMenuListProviderElement(super.provider);

  @override
  AppDataBase get database =>
      (origin as PartsTrainingMenuListProvider).database;
  @override
  int get partsId => (origin as PartsTrainingMenuListProvider).partsId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
