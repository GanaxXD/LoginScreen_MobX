import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_mobx/screens/taskScreen.dart';
import 'package:login_mobx/stores/login_store.dart';
import 'package:login_mobx/widgets/textfield.dart';
import 'package:mobx/mobx.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //Usando o mobx, não preciso de cotroladores
  TextEditingController login = TextEditingController();
  TextEditingController senha = TextEditingController();

  LoginStore loginscreen = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent.shade700,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Card(
              color: Colors.white,
              borderOnForeground: true,
              elevation: 12.9,
              shadowColor: Colors.blue.shade700,
              margin: const EdgeInsets.all(35),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: MyTextField(
                        login,
                        "Login",
                        Icon(Icons.login, color: Colors.indigo[900],),
                        null,
                        TextInputType.text,
                        loginscreen.setEmail,
                        true,
                        false
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: MyTextField(
                        senha,
                        "Senha",
                        Icon(Icons.lock, color: Colors.indigo[900],),
                        Icon(Icons.visibility, color: Colors.indigo[900],),
                        TextInputType.text,
                        loginscreen.setPassword,
                        true,
                        false
                    ),
                  ),
                  //Para que o computed formValidator seja ativado por essa tela, eu preciso
                  //colocar o botão dentro de um widget "Observer", para que o botão seja
                  //vgiado o tempo todo, e ativada a sua ação quando necessário.
                  Observer(
                     builder: (_){
                       return SizedBox(
                         child: IconButton(
                             iconSize: 35,
                             autofocus: true,
                             highlightColor: Colors.indigo.withAlpha(90),
                             splashColor: Colors.indigo,
                             splashRadius: 35,
                             padding: const EdgeInsets.all(20),
                             icon: Icon(Icons.directions_walk_outlined,
                               color: loginscreen.isFormValid ? Colors.purple : Colors.grey.withAlpha(999),
                             ),
                             onPressed: loginscreen.isFormValid ? (){
                               Navigator.of(context).pushReplacement(
                                   MaterialPageRoute(builder: (context)=> TaskScreen())
                               );
                             } : null
                         ),
                       );
                     },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

}
