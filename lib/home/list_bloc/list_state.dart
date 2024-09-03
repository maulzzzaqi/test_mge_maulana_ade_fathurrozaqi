part of 'list_bloc.dart';

class ListState extends Equatable {
  const ListState();
  
  @override
  List<Object> get props => [];
}

class ListLoading extends ListState {
  const ListLoading();
  
  @override
  List<Object> get props => [];
}

class ListLoaded extends ListState {
  final List<dynamic> list;

  const ListLoaded(this.list);

  @override
  List<Object> get props => [list];
}

class ListError extends ListState {
  final String error;

  const ListError(this.error);

  @override
  List<Object> get props => [error];
}
