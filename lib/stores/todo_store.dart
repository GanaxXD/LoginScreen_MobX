import 'package:mobx/mobx.dart';
part 'todo_store.g.dart';

class ToDoStore = _ToDoStore with _$ToDoStore;

abstract class _ToDoStore with Store{

    @observable
    String newToDo = "";

    @action
    void setNewToDo(String value) => newToDo = value;

    /*
    Lista que já funciona como um observable, por isso não precisa
    do @observable. Ela recria a lista conforme a ação a ela vinculada
    é realizada.
     */
    ObservableList<String> listToDo = ObservableList<String>();

    /*
    Estado comput:
    Este será usado para verificar se o campo de texto de inserção de uma ToDo
    está preenchido. Se sim, retorna true. A ideia é verificar se existe texto
    na barra de tarefas à adicionar na tela task-screen.dart. Se sim, o botão
    de salvar deve ser habilitado.
     */
    @computed
    bool get isNewToDoFull => newToDo.isEmpty;

    //Ação para preencher a lista observável
    @action
    void newElement(String value){
        listToDo.add(value);
    }
}