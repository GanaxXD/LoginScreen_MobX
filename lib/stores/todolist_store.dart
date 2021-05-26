import 'package:login_mobx/stores/todo_store.dart';
import 'package:mobx/mobx.dart';
part 'todolist_store.g.dart';

/*
Classe para representar a lista de tarefas
 */
class ToDoListStore = _ToDoListStore with _$ToDoListStore;

abstract class _ToDoListStore with Store{

    @observable
    String newToDo = "";

    @action
    void setNewToDo(String value) => newToDo = value;

    /*
    Lista que já funciona como um observable, por isso não precisa
    do @observable. Ela recria a lista conforme a ação a ela vinculada
    é realizada.
     */
    ObservableList<ToDoStore> listToDo = ObservableList<ToDoStore>();

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
    void newElement(){
        //Inserindo o item novo na posição zero da lista (inserindo no topo da lista)
        listToDo.insert(0, ToDoStore(newToDo));
    }
}