// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venda_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VendaStore on _VendaStore, Store {
  late final _$_vendaPendenteCarregandoAtom =
      Atom(name: '_VendaStore._vendaPendenteCarregando', context: context);

  @override
  bool get vendaPendenteCarregando {
    _$_vendaPendenteCarregandoAtom.reportRead();
    return super.vendaPendenteCarregando;
  }

  @override
  set vendaPendenteCarregando(bool value) {
    _$_vendaPendenteCarregandoAtom
        .reportWrite(value, super.vendaPendenteCarregando, () {
      super.vendaPendenteCarregando = value;
    });
  }

  late final _$_vendaPendenteCarregadoAtom =
      Atom(name: '_VendaStore._vendaPendenteCarregado', context: context);

  @override
  bool get vendaPendenteCarregado {
    _$_vendaPendenteCarregadoAtom.reportRead();
    return super.vendaPendenteCarregado;
  }

  @override
  set vendaPendenteCarregado(bool value) {
    _$_vendaPendenteCarregadoAtom
        .reportWrite(value, super.vendaPendenteCarregado, () {
      super.vendaPendenteCarregado = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_VendaStore.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$obterCarrinhoAsyncAction =
      AsyncAction('_VendaStore.obterCarrinho', context: context);

  @override
  Future<void> obterCarrinho() {
    return _$obterCarrinhoAsyncAction.run(() => super.obterCarrinho());
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage}
    ''';
  }
}
