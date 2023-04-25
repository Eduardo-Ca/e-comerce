// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProdutoStore on _ProdutoStore, Store {
  late final _$quantidadeAtom =
      Atom(name: '_ProdutoStore.quantidade', context: context);

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

  late final _$listaProdutosAtom =
      Atom(name: '_ProdutoStore.listaProdutos', context: context);

  @override
  ObservableList<ProductsModel> get listaProdutos {
    _$listaProdutosAtom.reportRead();
    return super.listaProdutos;
  }

  @override
  set listaProdutos(ObservableList<ProductsModel> value) {
    _$listaProdutosAtom.reportWrite(value, super.listaProdutos, () {
      super.listaProdutos = value;
    });
  }

  late final _$_produtosPendentesAtom =
      Atom(name: '_ProdutoStore._produtosPendentes', context: context);

  @override
  ObservableFuture<List<ProductsModel>>? get _produtosPendentes {
    _$_produtosPendentesAtom.reportRead();
    return super._produtosPendentes;
  }

  @override
  set _produtosPendentes(ObservableFuture<List<ProductsModel>>? value) {
    _$_produtosPendentesAtom.reportWrite(value, super._produtosPendentes, () {
      super._produtosPendentes = value;
    });
  }

  late final _$_produtosPendentesCarregandoAtom = Atom(
      name: '_ProdutoStore._produtosPendentesCarregando', context: context);

  @override
  bool get _produtosPendentesCarregando {
    _$_produtosPendentesCarregandoAtom.reportRead();
    return super._produtosPendentesCarregando;
  }

  @override
  set _produtosPendentesCarregando(bool value) {
    _$_produtosPendentesCarregandoAtom
        .reportWrite(value, super._produtosPendentesCarregando, () {
      super._produtosPendentesCarregando = value;
    });
  }

  late final _$_produtosPendentesCarregadoAtom =
      Atom(name: '_ProdutoStore._produtosPendentesCarregado', context: context);

  @override
  bool get _produtosPendentesCarregado {
    _$_produtosPendentesCarregadoAtom.reportRead();
    return super._produtosPendentesCarregado;
  }

  @override
  set _produtosPendentesCarregado(bool value) {
    _$_produtosPendentesCarregadoAtom
        .reportWrite(value, super._produtosPendentesCarregado, () {
      super._produtosPendentesCarregado = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_ProdutoStore.errorMessage', context: context);

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

  late final _$obterProdutosAsyncAction =
      AsyncAction('_ProdutoStore.obterProdutos', context: context);

  @override
  Future<void> obterProdutos() {
    return _$obterProdutosAsyncAction.run(() => super.obterProdutos());
  }

  @override
  String toString() {
    return '''
quantidade: ${quantidade},
listaProdutos: ${listaProdutos},
errorMessage: ${errorMessage}
    ''';
  }
}
