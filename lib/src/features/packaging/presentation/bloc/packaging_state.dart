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
