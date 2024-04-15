// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prev_training_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$prevTrainingDataHash() => r'0a9dea5d7ee813faf76391f1276136481d929a9c';

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

/// See also [prevTrainingData].
@ProviderFor(prevTrainingData)
const prevTrainingDataProvider = PrevTrainingDataFamily();

/// See also [prevTrainingData].
class PrevTrainingDataFamily
    extends Family<AsyncValue<List<TrainingDateData>>> {
  /// See also [prevTrainingData].
  const PrevTrainingDataFamily();

  /// See also [prevTrainingData].
  PrevTrainingDataProvider call(
    AppDataBase database,
    int partsId,
    int trainingId,
    DateTime date,
  ) {
    return PrevTrainingDataProvider(
      database,
      partsId,
      trainingId,
      date,
    );
  }

  @override
  PrevTrainingDataProvider getProviderOverride(
    covariant PrevTrainingDataProvider provider,
  ) {
    return call(
      provider.database,
      provider.partsId,
      provider.trainingId,
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
  String? get name => r'prevTrainingDataProvider';
}

/// See also [prevTrainingData].
class PrevTrainingDataProvider
    extends AutoDisposeFutureProvider<List<TrainingDateData>> {
  /// See also [prevTrainingData].
  PrevTrainingDataProvider(
    AppDataBase database,
    int partsId,
    int trainingId,
    DateTime date,
  ) : this._internal(
          (ref) => prevTrainingData(
            ref as PrevTrainingDataRef,
            database,
            partsId,
            trainingId,
            date,
          ),
          from: prevTrainingDataProvider,
          name: r'prevTrainingDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$prevTrainingDataHash,
          dependencies: PrevTrainingDataFamily._dependencies,
          allTransitiveDependencies:
              PrevTrainingDataFamily._allTransitiveDependencies,
          database: database,
          partsId: partsId,
          trainingId: trainingId,
          date: date,
        );

  PrevTrainingDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.database,
    required this.partsId,
    required this.trainingId,
    required this.date,
  }) : super.internal();

  final AppDataBase database;
  final int partsId;
  final int trainingId;
  final DateTime date;

  @override
  Override overrideWith(
    FutureOr<List<TrainingDateData>> Function(PrevTrainingDataRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PrevTrainingDataProvider._internal(
        (ref) => create(ref as PrevTrainingDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        database: database,
        partsId: partsId,
        trainingId: trainingId,
        date: date,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<TrainingDateData>> createElement() {
    return _PrevTrainingDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PrevTrainingDataProvider &&
        other.database == database &&
        other.partsId == partsId &&
        other.trainingId == trainingId &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, database.hashCode);
    hash = _SystemHash.combine(hash, partsId.hashCode);
    hash = _SystemHash.combine(hash, trainingId.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PrevTrainingDataRef
    on AutoDisposeFutureProviderRef<List<TrainingDateData>> {
  /// The parameter `database` of this provider.
  AppDataBase get database;

  /// The parameter `partsId` of this provider.
  int get partsId;

  /// The parameter `trainingId` of this provider.
  int get trainingId;

  /// The parameter `date` of this provider.
  DateTime get date;
}

class _PrevTrainingDataProviderElement
    extends AutoDisposeFutureProviderElement<List<TrainingDateData>>
    with PrevTrainingDataRef {
  _PrevTrainingDataProviderElement(super.provider);

  @override
  AppDataBase get database => (origin as PrevTrainingDataProvider).database;
  @override
  int get partsId => (origin as PrevTrainingDataProvider).partsId;
  @override
  int get trainingId => (origin as PrevTrainingDataProvider).trainingId;
  @override
  DateTime get date => (origin as PrevTrainingDataProvider).date;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
