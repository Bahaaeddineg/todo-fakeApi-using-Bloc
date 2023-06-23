part of 'todo_bloc_bloc.dart';

@immutable
abstract class TodoBlocState {}

class LoadingState extends TodoBlocState {}

class LoadedData extends TodoBlocState{
  final List list;
  LoadedData({required this.list});
}

class ErrorState extends TodoBlocState{
  final String message;
  ErrorState({required this.message});
}

