// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parts_total_weight.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$partsTotalWeightDataHash() =>
    r'6563c7517e7c3e1dc1511bee3f8e28e424e2f6bc';

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

abstract class _$PartsTotalWeightData
    extends BuildlessAutoDisposeStreamNotifier<double> {
  late final AppDataBase database;
  late final int partsId;
  late final DateTime date;

  Stream<double> build(
    AppDataBase database,
    int partsId,
    DateTime date,
  );
}

/// See also [PartsTotalWeightData].
@ProviderFor(PartsTotalWeightData)
const partsTotalWeightDataProvider = PartsTotalWeightDataFamily();

/// See also [PartsTotalWeightData].
class PartsTotalWeightDataFamily extends Family<AsyncValue<double>> {
  /// See also [PartsTotalWeightData].
  const PartsTotalWeightDataFamily();

  /// See also [PartsTotalWeightData].
  PartsTotalWeightDataProvider call(
    AppDataBase database,
    int partsId,
    DateTime date,
  ) {
    return PartsTotalWeightDataProvider(
      database,
      partsId,
      date,
    );
  }

  @override
  PartsTotalWeightDataProvider getProviderOverride(
    covariant PartsTotalWeightDataProvider provider,
  ) {
    return call(
      provider.database,
      provider.partsId,
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
  String? get name => r'partsTotalWeightDataProvider';
}

/// See also [PartsTotalWeightData].
class PartsTotalWeightDataProvider
    extends AutoDisposeStreamNotifierProviderImpl<PartsTotalWeightData,
        double> {
  /// See also [PartsTotalWeightData].
  PartsTotalWeightDataProvider(
    AppDataBase database,
    int partsId,
    DateTime date,
  ) : this._internal(
          () => PartsTotalWeightData()
            ..database = database
            ..partsId = partsId
            ..date = date,
          from: partsTotalWeightDataProvider,
          name: r'partsTotalWeightDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$partsTotalWeightDataHash,
          dependencies: PartsTotalWeightDataFamily._dependencies,
          allTransitiveDependencies:
              PartsTotalWeightDataFamily._allTransitiveDependencies,
          database: database,
          partsId: partsId,
          date: date,
        );

  PartsTotalWeightDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.database,
    required this.partsId,
    required this.date,
  }) : super.internal();

  final AppDataBase database;
  final int partsId;
  final DateTime date;

  @override
  Stream<double> runNotifierBuild(
    covariant PartsTotalWeightData notifier,
  ) {
    return notifier.build(
      database,
      partsId,
      date,
    );
  }

  @override
  Override overrideWith(PartsTotalWeightData Function() create) {
    return ProviderOverride(
      origin: this,
      override: PartsTotalWeightDataProvider._internal(
        () => create()
          ..database = database
          ..partsId = partsId
          ..date = date,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        database: database,
        partsId: partsId,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<PartsTotalWeightData, double>
      createElement() {
    return _PartsTotalWeightDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PartsTotalWeightDataProvider &&
        other.database == database &&
        other.partsId == partsId &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, database.hashCode);
    hash = _SystemHash.combine(hash, partsId.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PartsTotalWeightDataRef on AutoDisposeStreamNotifierProviderRef<double> {
  /// The parameter `database` of this provider.
  AppDataBase get database;

  /// The parameter `partsId` of this provider.
  int get partsId;

  /// The parameter `date` of this provider.
  DateTime get date;
}

class _PartsTotalWeightDataProviderElement
    extends AutoDisposeStreamNotifierProviderElement<PartsTotalWeightData,
        double> with PartsTotalWeightDataRef {
  _PartsTotalWeightDataProviderElement(super.provider);

  @override
  AppDataBase get database => (origin as PartsTotalWeightDataProvider).database;
  @override
  int get partsId => (origin as PartsTotalWeightDataProvider).partsId;
  @override
  DateTime get date => (origin as PartsTotalWeightDataProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
