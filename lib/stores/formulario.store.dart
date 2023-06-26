import 'package:ecomerce/modules/usuario/data/models/usuario_model.dart';
import 'package:mobx/mobx.dart';

part 'formulario.store.g.dart';

//flutter pub run build_runner build
//flutter pub run build_runner build --delete-conflicting-outputs
// ignore: library_private_types_in_public_api
class formularioStore = _formularioStoreBase with _$formularioStore;

abstract class _formularioStoreBase with Store {

  @observable
  UsuarioModel usuario = UsuarioModel(); 

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isPasswordValid =>  RegExp(r"^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{1,30}$").hasMatch(password);

  @computed
  bool get isEmailValid =>RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
}
