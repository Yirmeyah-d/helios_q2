import 'package:equatable/equatable.dart';
import 'package:helios_q2/src/features/packaging/domain/repositories/packaging_repository.dart';

class PackedUp {
  final PackagingRepository repository;

  PackedUp(this.repository);

  Future<String> call(Params params) async {
    return await repository.packedUp(params.itemsToPack);
  }
}

class Params extends Equatable {
  final List<int> itemsToPack;

  const Params({required this.itemsToPack});

  @override
  List<Object> get props => [itemsToPack];
}
