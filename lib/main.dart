import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/todo_bloc_bloc.dart';
import 'bloc/todo_bloc_event.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => TodoBlocBloc()..add(NeedData()),
      child: MaterialApp(home: Home())));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "todos",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<TodoBlocBloc,TodoBlocState>(
        builder: (context, state) {
          if (state is LoadedData) {
            return TodoWidget(listt: state.list,);
          }else if (state is ErrorState){
            return Text(state.message);
          }else {
            return const Text("loading");
          }
        },
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final List listt;
  const TodoWidget({super.key,required this.listt});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
       
            Expanded(
                child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.task),
                  style: ListTileStyle.list,
                  title: Text(listt[index]),
                ),
                itemCount: listt.length,
              ))
      ]),
    );
  }
}
