import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../data.dart';

import  'todo_bloc_event.dart';
part 'todo_bloc_state.dart';

class TodoBlocBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  TodoBlocBloc() : super(LoadingState()) {
    on<TodoBlocEvent>((event, emit) async {
      if (event is NeedData) {
        emit(LoadingState());

        try {
          final list = await Api().getData();
          emit(LoadedData(list: list));
        } catch (e) {
          emit(ErrorState(message: "Something went wrong"));
        }
      }
    });
  }
}
