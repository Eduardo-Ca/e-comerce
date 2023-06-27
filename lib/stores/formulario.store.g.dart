// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'formulario.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$formularioStore on _FormularioStoreBase, Store {
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_formularioStoreBase.isPasswordValid'))
          .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_formularioStoreBase.isEmailValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_formularioStoreBase.isFormValid'))
          .value;

  late final _$usuarioAtom =
      Atom(name: '_formularioStoreBase.usuario', context: context);

  @override
  UsuarioModel get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(UsuarioModel value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_formularioStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$senhaVisivelAtom =
      Atom(name: '_formularioStoreBase.senhaVisivel', context: context);

  @override
  bool get senhaVisivel {
    _$senhaVisivelAtom.reportRead();
    return super.senhaVisivel;
  }

  @override
  set senhaVisivel(bool value) {
    _$senhaVisivelAtom.reportWrite(value, super.senhaVisivel, () {
      super.senhaVisivel = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_formularioStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$_formularioStoreBaseActionController =
      ActionController(name: '_formularioStoreBase', context: context);

  @override
  void setSenhaVisivel(bool value) {
    final _$actionInfo = _$_formularioStoreBaseActionController.startAction(
        name: '_formularioStoreBase.setSenhaVisivel');
    try {
      return super.setSenhaVisivel(value);
    } finally {
      _$_formularioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_formularioStoreBaseActionController.startAction(
        name: '_formularioStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_formularioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_formularioStoreBaseActionController.startAction(
        name: '_formularioStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_formularioStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
email: ${email},
senhaVisivel: ${senhaVisivel},
password: ${password},
isPasswordValid: ${isPasswordValid},
isEmailValid: ${isEmailValid},
isFormValid: ${isFormValid}
    ''';
  }
}
