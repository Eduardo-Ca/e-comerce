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

  late final _$produtosPendentesCarregandoAtom =
      Atom(name: '_ProdutoStore.produtosPendentesCarregando', context: context);

  @override
  bool get produtosPendentesCarregando {
    _$produtosPendentesCarregandoAtom.reportRead();
    return super.produtosPendentesCarregando;
  }

  @override
  set produtosPendentesCarregando(bool value) {
    _$produtosPendentesCarregandoAtom
        .reportWrite(value, super.produtosPendentesCarregando, () {
      super.produtosPendentesCarregando = value;
    });
  }

  late final _$produtosPendentesCarregadoAtom =
      Atom(name: '_ProdutoStore.produtosPendentesCarregado', context: context);

  @override
  bool get produtosPendentesCarregado {
    _$produtosPendentesCarregadoAtom.reportRead();
    return super.produtosPendentesCarregado;
  }

  @override
  set produtosPendentesCarregado(bool value) {
    _$produtosPendentesCarregadoAtom
        .reportWrite(value, super.produtosPendentesCarregado, () {
      super.produtosPendentesCarregado = value;
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

  late final _$listaCategoriasAtom =
      Atom(name: '_ProdutoStore.listaCategorias', context: context);

  @override
  ObservableList<String> get listaCategorias {
    _$listaCategoriasAtom.reportRead();
    return super.listaCategorias;
  }

  @override
  set listaCategorias(ObservableList<String> value) {
    _$listaCategoriasAtom.reportWrite(value, super.listaCategorias, () {
      super.listaCategorias = value;
    });
  }

  late final _$_categoriasPendentesAtom =
      Atom(name: '_ProdutoStore._categoriasPendentes', context: context);

  @override
  ObservableFuture<List<String>>? get _categoriasPendentes {
    _$_categoriasPendentesAtom.reportRead();
    return super._categoriasPendentes;
  }

  @override
  set _categoriasPendentes(ObservableFuture<List<String>>? value) {
    _$_categoriasPendentesAtom.reportWrite(value, super._categoriasPendentes,
        () {
      super._categoriasPendentes = value;
    });
  }

  late final _$_categoriasPendentesCarregandoAtom = Atom(
      name: '_ProdutoStore._categoriasPendentesCarregando', context: context);

  @override
  bool get categoriasPendentesCarregando {
    _$_categoriasPendentesCarregandoAtom.reportRead();
    return super.categoriasPendentesCarregando;
  }

  @override
  set categoriasPendentesCarregando(bool value) {
    _$_categoriasPendentesCarregandoAtom
        .reportWrite(value, super.categoriasPendentesCarregando, () {
      super.categoriasPendentesCarregando = value;
    });
  }

  late final _$_categoriasPendentesCarregadoAtom = Atom(
      name: '_ProdutoStore._categoriasPendentesCarregado', context: context);

  @override
  bool get categoriasPendentesCarregado {
    _$_categoriasPendentesCarregadoAtom.reportRead();
    return super.categoriasPendentesCarregado;
  }

  @override
  set categoriasPendentesCarregado(bool value) {
    _$_categoriasPendentesCarregadoAtom
        .reportWrite(value, super.categoriasPendentesCarregado, () {
      super.categoriasPendentesCarregado = value;
    });
  }

  late final _$obterProdutosAsyncAction =
      AsyncAction('_ProdutoStore.obterProdutos', context: context);

  @override
  Future<void> obterProdutos(String? valorPesquisa, String? categoria) {
    return _$obterProdutosAsyncAction
        .run(() => super.obterProdutos(valorPesquisa, categoria));
  }

  late final _$obterCategoriasAsyncAction =
      AsyncAction('_ProdutoStore.obterCategorias', context: context);

  @override
  Future<void> obterCategorias() {
    return _$obterCategoriasAsyncAction.run(() => super.obterCategorias());
  }

  @override
  String toString() {
    return '''
quantidade: ${quantidade},
listaProdutos: ${listaProdutos},
produtosPendentesCarregando: ${produtosPendentesCarregando},
produtosPendentesCarregado: ${produtosPendentesCarregado},
errorMessage: ${errorMessage},
listaCategorias: ${listaCategorias}
    ''';
  }
}
