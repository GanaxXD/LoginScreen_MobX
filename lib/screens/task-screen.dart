import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_mobx/screens/login-screen.dart';
import 'package:login_mobx/stores/todo_store.dart';
import 'package:login_mobx/stores/todolist_store.dart';
import 'package:login_mobx/widgets/textfield.dart';

class TaskScreen extends StatefulWidget {
    @override
    _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

    ToDoListStore todoListStore =  ToDoListStore();

    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: Scaffold(
                floatingActionButton: IconButton(
                    padding: const EdgeInsets.only(top: 25, bottom: 35),
                    splashRadius: 120,
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                    onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                ),
                backgroundColor: Colors.purpleAccent[400].withAlpha(90),
                appBar: AppBar(
                    backgroundColor: Colors.purple,
                    shadowColor: Colors.indigoAccent[300],
                    title: Text("Tarefas", style: TextStyle(color: Colors.white),),
                    brightness: Brightness.dark,
                ),
                body: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                        Observer(builder: (_){
                            return Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                                child: MyTextField(
                                    hint: "Digite uma tarefa",
                                    prefix: null,
                                    suffix: !todoListStore.isNewToDoFull ?
                                    IconButton(
                                        icon: Icon(Icons.save),
                                        color: Colors.white,
                                        onPressed: todoListStore.newElement,
                                    )
                                        : null,
                                    textInputType: TextInputType.text,
                                    onChanged: todoListStore.setNewToDo,
                                    enabled: true,
                                    obscure: false
                                ),
                            );
                        }),
                        Expanded(
                            child: Observer(
                                builder: (__){
                                    return ListView.separated(
                                        shrinkWrap: true,
                                        reverse: false,
                                        itemCount: todoListStore.listToDo.length,
                                        separatorBuilder: (_, __){
                                            return Divider( color: Colors.indigo[600], thickness: 1, indent: 20, endIndent: 20, height: 0.1,);
                                        },
                                        itemBuilder: (_, index){
                                            final todo = todoListStore.listToDo[index];
                                            return Observer(builder: (_){
                                               return ListTile(
                                                   title: Text("${todo.todo}",
                                                       style: TextStyle(
                                                           color: !todo.done ? Colors.white : Colors.grey,
                                                           fontStyle: FontStyle.italic,
                                                           fontSize: !todo.done ? 16 : 12,
                                                           textBaseline: TextBaseline.alphabetic,
                                                           fontWeight: FontWeight.w900,
                                                           height: 0.5,
                                                           decoration: todo.done ? TextDecoration.lineThrough : null
                                                       ),
                                                       overflow: TextOverflow.ellipsis,
                                                   ),
                                                   subtitle: Text(!todo.done ? "Clique na tarefa para marcá-la como concluída." : "Concluída",
                                                       style: TextStyle(
                                                           color: !todo.done ? Colors.white70 : Colors.grey,
                                                           fontStyle: FontStyle.italic,
                                                           fontSize: 12,
                                                           textBaseline: TextBaseline.alphabetic,
                                                           fontWeight: FontWeight.w900,
                                                           height: 0.5,
                                                       ),overflow: TextOverflow.ellipsis),
                                                   onTap: todo.setDoneToDo,
                                               );
                                            });
                                        },
                                    );
                                }
                            ),
                        ),
                    ],
                ),
            )
        );
    }
}
