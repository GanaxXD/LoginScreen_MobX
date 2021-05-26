import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_mobx/screens/task-screen.dart';
import 'package:login_mobx/stores/login_store.dart';
import 'package:login_mobx/widgets/textfield.dart';
import 'package:mobx/mobx.dart';

class LoginScreen extends StatefulWidget {
    @override
    _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

    LoginStore loginscreen = LoginStore();

    /*
    //Para parar o ciclo de reações infinitas
    ReactionDisposer disposer;


    //função para parar a reação infinita
    @override
    void dispose() {
        disposer();
        super.dispose();
    }

    @override
    void didChangeDependencies() {
        super.didChangeDependencies();
        //fazendo com que o sistema mude de página conforme reação do loggedIn
        autorun((_){
            if(loginscreen.loggedIn){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_)=>TaskScreen()));
            }
        });

    // Forma alternativa:
    // Outra forma é usando a reaction. Na reaction, eu passo primeiro qual função
    // eu vou observar, e em seguida, o que ele deve fazer (reação), conforme exemplo abaixo.
    // Entretanto, a reação fica rodando o tempo todo, então, para pará-la depois que houver a ateração
    // no função que eu estou observando, eu preciso dar um dispose. Por isso a reaction é o resultado do dipose
    //
    disposer = reaction(
      //função que repassa o que eu quero observação para ativar a reação
        (_)=> loginscreen.loggedIn,
        //reação feita após a mudança na função passada acima
        (loggedIn){
            if(loggedIn){
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_)=>  TaskScreen()));
            }
        }
    );

    }*/

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
                                        hint: "Login",
                                        prefix: Icon(Icons.login, color: Colors.white,),
                                        suffix: null,
                                        textInputType: TextInputType.text,
                                        onChanged: loginscreen.setEmail,
                                        enabled: !loginscreen.loading,
                                        obscure: false
                                    ),
                                ),

                                Observer(
                                    builder: (_){
                                        return MyTextField(
                                            hint: "Senha",
                                            prefix: Icon(Icons.lock, color: Colors.white,),
                                            suffix: IconButton(
                                                icon: Icon(!loginscreen.tooglePasswordIsValid ?
                                                Icons.visibility : Icons.visibility_off,
                                                    color: Colors.white,),
                                                onPressed: loginscreen.settooglePasswordChange,
                                                splashColor: Colors.white,
                                            ),
                                            textInputType: TextInputType.text,
                                            onChanged: loginscreen.setPassword,
                                            enabled: !loginscreen.loading,
                                            obscure: loginscreen.tooglePasswordIsValid
                                        );
                                    }
                                ),

                                //Para que o computed formValidator seja ativado por essa tela, eu preciso
                                //colocar o botão dentro de um widget "Observer", para que o botão seja
                                //vgiado o tempo td, e ativada a sua ação quando necessário.
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
                                                //onPressed: loginscreen.loginPressed,
                                                onPressed: (){
                                                    Navigator.of(context).pushReplacement(
                                                        MaterialPageRoute(builder: (_)=>  TaskScreen()));
                                                },
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
