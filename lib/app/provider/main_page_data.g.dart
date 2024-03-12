// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mainPageDataHash() => r'b621ee0477c12afdc79317214d2691f0eb6834a1';

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

/// See also [mainPageData].
@ProviderFor(mainPageData)
const mainPageDataProvider = MainPageDataFamily();

/// See also [mainPageData].
class MainPageDataFamily extends Family<AsyncValue<MainPageModel>> {
  /// See also [mainPageData].
  const MainPageDataFamily();

  /// See also [mainPageData].
  MainPageDataProvider call(
    AppDataBase database,
    DateTime tgtDate,
  ) {
    return MainPageDataProvider(
      database,
      tgtDate,
    );
  }

  @override
  MainPageDataProvider getProviderOverride(
    covariant MainPageDataProvider provider,
  ) {
    return call(
      provider.database,
      provider.tgtDate,
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
  String? get name => r'mainPageDataProvider';
}

/// See also [mainPageData].
class MainPageDataProvider extends AutoDisposeFutureProvider<MainPageModel> {
  /// See also [mainPageData].
  MainPageDataProvider(
    AppDataBase database,
    DateTime tgtDate,
  ) : this._internal(
          (ref) => mainPageData(
            ref as MainPageDataRef,
            database,
            tgtDate,
          ),
          from: mainPageDataProvider,
          name: r'mainPageDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$mainPageDataHash,
          dependencies: MainPageDataFamily._dependencies,
          allTransitiveDependencies:
              MainPageDataFamily._allTransitiveDependencies,
          database: database,
          tgtDate: tgtDate,
        );

  MainPageDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.database,
    required this.tgtDate,
  }) : super.internal();

  final AppDataBase database;
  final DateTime tgtDate;

  @override
  Override overrideWith(
    FutureOr<MainPageModel> Function(MainPageDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MainPageDataProvider._internal(
        (ref) => create(ref as MainPageDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        database: database,
        tgtDate: tgtDate,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MainPageModel> createElement() {
    return _MainPageDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MainPageDataProvider &&
        other.database == database &&
        other.tgtDate == tgtDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, database.hashCode);
    hash = _SystemHash.combine(hash, tgtDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MainPageDataRef on AutoDisposeFutureProviderRef<MainPageModel> {
  /// The parameter `database` of this provider.
  AppDataBase get database;

  /// The parameter `tgtDate` of this provider.
  DateTime get tgtDate;
}

class _MainPageDataProviderElement
    extends AutoDisposeFutureProviderElement<MainPageModel>
    with MainPageDataRef {
  _MainPageDataProviderElement(super.provider);

  @override
  AppDataBase get database => (origin as MainPageDataProvider).database;
  @override
  DateTime get tgtDate => (origin as MainPageDataProvider).tgtDate;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
