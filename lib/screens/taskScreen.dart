import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_mobx/screens/login-screen.dart';
import 'package:login_mobx/widgets/textfield.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  TextEditingController controllerText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: MyTextField("Digite uma tarefa", null,
                      Icon(Icons.save, color: Colors.white,),
                      TextInputType.text,
                      (value){

                      },
                      true, false),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  separatorBuilder: (_, __){
                    return Divider( color: Colors.indigo[600], thickness: 1, indent: 20, endIndent: 20, height: 0.1,);
                  },
                  itemBuilder: (_, index){
                    return ListTile(
                      title: Text("Tarefa $index", style: TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic,
                          fontSize: 14,
                          textBaseline: TextBaseline.alphabetic,
                          fontWeight: FontWeight.w900,
                          height: 0.5
                      ), overflow: TextOverflow.ellipsis,),
                      onTap: (){

                      },
                    );
                  },
                )
              ],
            ),
          )
    );
  }
}
