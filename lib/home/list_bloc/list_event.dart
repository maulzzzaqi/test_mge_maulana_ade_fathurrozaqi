part of 'list_bloc.dart';

class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object> get props => [];
}

class FetchList extends ListEvent {
  const FetchList();

  @override
  List<Object> get props => [];
}

class DeleteList extends ListEvent {
  final dynamic list;

  const DeleteList(this.list);

  @override
  List<Object> get props => [list];
}
