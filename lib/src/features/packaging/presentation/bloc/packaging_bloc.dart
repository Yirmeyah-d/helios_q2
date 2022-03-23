import 'package:equatable/equatable.dart';
import 'package:helios_q2/src/features/packaging/domain/use_cases/packed_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'packaging_event.dart';
part 'packaging_state.dart';

class PackagingBloc extends Bloc<PackagingEvent, PackagingState> {
  final PackedUp packedUp;

  PackagingBloc({
    required this.packedUp,
  }) : super(PackagingInitial()) {
    on<PackingItemsEvent>(_onPackingItemsEvent);
  }

  Future<void> _onPackingItemsEvent(
    PackingItemsEvent event,
    Emitter<PackagingState> emit,
  ) async {
    emit(PackingInProgress());
    final packedItems = await packedUp(Params(itemsToPack: event.itemsToPack));
    emit(PackingFinished(packedItems: packedItems));
  }
}
