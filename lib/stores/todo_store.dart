import 'package:mobx/mobx.dart';
part 'todo_store.g.dart';

/*
Calsse que representará a tarefa
 */
class ToDoStore = _ToDoStore with _$ToDoStore;

abstract class _ToDoStore with Store{

    final String todo;

    _ToDoStore(this.todo);


    @observable
    bool done = false;

    @action
    void setDoneToDo() => done = !done;
}