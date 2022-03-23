part of 'packaging_bloc.dart';

abstract class PackagingState extends Equatable {
  const PackagingState();
}

class PackagingInitial extends PackagingState {
  @override
  List<Object> get props => [];
}

class PackingInProgress extends PackagingState {
  @override
  List<Object> get props => [];
}

class PackingFinished extends PackagingState {
  final String packedItems;
  const PackingFinished({required this.packedItems});

  @override
  List<Object> get props => [packedItems];
}

class PackingError extends PackagingState {
  final String message;
  const PackingError({required this.message});

  @override
  List<Object> get props => [message];
}
