import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(const ListState()) {
    on<FetchList>((event, emit) async {
      emit(const ListLoading());
      try {
        final response = await get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
        if (response.statusCode == 200) {
          final lists = json.decode(response.body);
          emit(ListLoaded(lists));
        }
      } catch (e) {
        emit(ListError(e.toString()));
      }
    });
  }
}
