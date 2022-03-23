import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:helios_q2/src/features/packaging/domain/use_cases/packed_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/input_converter.dart';
part 'packaging_event.dart';
part 'packaging_state.dart';

const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The input should be a strings of integer containing number between 1 to 9.';

class PackagingBloc extends Bloc<PackagingEvent, PackagingState> {
  final PackedUp packedUp;
  final InputConverter inputConverter;

  PackagingBloc({
    required this.packedUp,
    required this.inputConverter,
  }) : super(PackagingInitial()) {
    on<PackingItemsEvent>(_onPackingItemsEvent);
  }

  Future<void> _onPackingItemsEvent(
    PackingItemsEvent event,
    Emitter<PackagingState> emit,
  ) async {
    final inputEither = inputConverter.stringToIntList(event.itemsToPack);
    await inputEither.fold(
      (failure) async =>
          emit(const PackingError(message: INVALID_INPUT_FAILURE_MESSAGE)),
      (itemsToPack) async {
        emit(PackingInProgress());
        final packedItems = await packedUp(Params(itemsToPack: itemsToPack));
        emit(PackingFinished(packedItems: packedItems));
      },
    );
  }
}
