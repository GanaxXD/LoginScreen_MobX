import 'package:email_validator/email_validator.dart';
import 'package:mobx/mobx.dart';
import 'package:regexed_validator/regexed_validator.dart';
part 'login_store.g.dart';


class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{

  /*
  ** O construtor autorun é uma função que roda sempre que uma action for
  * ativada. Dessa forma, qualquer ação pode ser feita EM
  * UM OBSERVABLE
   */
  _LoginStore(){
    autorun((_){
      print(email);
      print(password);
      print(tooglePasswordIsValid);

    });
  }

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  bool tooglePasswordIsValid = true;

  @action
  void settooglePasswordChange() => tooglePasswordIsValid = !tooglePasswordIsValid;

  //Para validar o email, utilizarei a biblioteca Email_Validator (email_validator: '^1.0.5'), mas pode-se usar o reGex
  //Computed SEMPRE deve ser um getter
  @computed
  bool get isEmailValid => EmailValidator.validate(email);

  //Utilizarei a biblioteca regex_validator, para facilitar. Pode até ser usada para email tbm.
  //Verificar porque o mobX está tendo dificuldade em renderizar as alterações de estados com o hotreload
  @computed
  bool get isPasswordValid => validator.password(password);

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;

}