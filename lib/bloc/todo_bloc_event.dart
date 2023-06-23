import 'package:flutter/material.dart';
import 'todo_bloc_bloc.dart';

@immutable
abstract class TodoBlocEvent {}


class NeedData extends TodoBlocEvent{}
