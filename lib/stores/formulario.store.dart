import 'package:mobx/mobx.dart';

part 'formulario.store.g.dart';

//flutter pub run build_runner build
//flutter pub run build_runner build --delete-conflicting-outputs
// ignore: library_private_types_in_public_api
class formularioStore = _formularioStoreBase with _$formularioStore;

abstract class _formularioStoreBase with Store {
  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void SetPassword(String value) => password = value;

  @computed
  bool get isPasswordValid =>  password.length > 6;

  @computed
    bool get isEmailValid =>
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
}