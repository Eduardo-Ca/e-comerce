// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venda_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VendaStore on _VendaStore, Store {
  late final _$quantidadeAtom =
      Atom(name: '_VendaStore.quantidade', context: context);

  @override
  int get quantidade {
    _$quantidadeAtom.reportRead();
    return super.quantidade;
  }

  @override
  set quantidade(int value) {
    _$quantidadeAtom.reportWrite(value, super.quantidade, () {
      super.quantidade = value;
    });
  }

  late final _$vendaAtom = Atom(name: '_VendaStore.venda', context: context);

  @override
  VendaModel get venda {
    _$vendaAtom.reportRead();
    return super.venda;
  }

  @override
  set venda(VendaModel value) {
    _$vendaAtom.reportWrite(value, super.venda, () {
      super.venda = value;
    });
  }

  late final _$_vendaPendenteAtom =
      Atom(name: '_VendaStore._vendaPendente', context: context);

  @override
  Future<VendaModel> get _vendaPendente {
    _$_vendaPendenteAtom.reportRead();
    return super._vendaPendente;
  }

  @override
  set _vendaPendente(Future<VendaModel> value) {
    _$_vendaPendenteAtom.reportWrite(value, super._vendaPendente, () {
      super._vendaPendente = value;
    });
  }

  late final _$_vendaPendenteCarregandoAtom =
      Atom(name: '_VendaStore._vendaPendenteCarregando', context: context);

  @override
  bool get _vendaPendenteCarregando {
    _$_vendaPendenteCarregandoAtom.reportRead();
    return super._vendaPendenteCarregando;
  }

  @override
  set _vendaPendenteCarregando(bool value) {
    _$_vendaPendenteCarregandoAtom
        .reportWrite(value, super._vendaPendenteCarregando, () {
      super._vendaPendenteCarregando = value;
    });
  }

  late final _$_vendaPendenteCarregadoAtom =
      Atom(name: '_VendaStore._vendaPendenteCarregado', context: context);

  @override
  bool get _vendaPendenteCarregado {
    _$_vendaPendenteCarregadoAtom.reportRead();
    return super._vendaPendenteCarregado;
  }

  @override
  set _vendaPendenteCarregado(bool value) {
    _$_vendaPendenteCarregadoAtom
        .reportWrite(value, super._vendaPendenteCarregado, () {
      super._vendaPendenteCarregado = value;
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
quantidade: ${quantidade},
venda: ${venda},
errorMessage: ${errorMessage}
    ''';
  }
}
