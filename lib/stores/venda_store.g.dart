// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venda_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VendaStore on _VendaStore, Store {
  late final _$carrinhoAtom =
      Atom(name: '_VendaStore.carrinho', context: context);

  @override
  ObservableList<VendaModel> get carrinho {
    _$carrinhoAtom.reportRead();
    return super.carrinho;
  }

  @override
  set carrinho(ObservableList<VendaModel> value) {
    _$carrinhoAtom.reportWrite(value, super.carrinho, () {
      super.carrinho = value;
    });
  }

  late final _$_vendaPendenteAtom =
      Atom(name: '_VendaStore._vendaPendente', context: context);

  @override
  ObservableFuture<List<VendaModel>>? get _vendaPendente {
    _$_vendaPendenteAtom.reportRead();
    return super._vendaPendente;
  }

  @override
  set _vendaPendente(ObservableFuture<List<VendaModel>>? value) {
    _$_vendaPendenteAtom.reportWrite(value, super._vendaPendente, () {
      super._vendaPendente = value;
    });
  }

  late final _$vendaPendenteCarregandoAtom =
      Atom(name: '_VendaStore.vendaPendenteCarregando', context: context);

  @override
  bool get vendaPendenteCarregando {
    _$vendaPendenteCarregandoAtom.reportRead();
    return super.vendaPendenteCarregando;
  }

  @override
  set vendaPendenteCarregando(bool value) {
    _$vendaPendenteCarregandoAtom
        .reportWrite(value, super.vendaPendenteCarregando, () {
      super.vendaPendenteCarregando = value;
    });
  }

  late final _$vendaPendenteCarregadoAtom =
      Atom(name: '_VendaStore.vendaPendenteCarregado', context: context);

  @override
  bool get vendaPendenteCarregado {
    _$vendaPendenteCarregadoAtom.reportRead();
    return super.vendaPendenteCarregado;
  }

  @override
  set vendaPendenteCarregado(bool value) {
    _$vendaPendenteCarregadoAtom
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
carrinho: ${carrinho},
vendaPendenteCarregando: ${vendaPendenteCarregando},
vendaPendenteCarregado: ${vendaPendenteCarregado},
errorMessage: ${errorMessage}
    ''';
  }
}
