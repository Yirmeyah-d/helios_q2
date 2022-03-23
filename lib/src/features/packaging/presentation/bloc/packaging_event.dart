part of 'packaging_bloc.dart';

abstract class PackagingEvent extends Equatable {
  const PackagingEvent();
}

class PackingItemsEvent extends PackagingEvent {
  final String itemsToPack;
  const PackingItemsEvent(this.itemsToPack);

  @override
  List<Object?> get props => [itemsToPack];
}
