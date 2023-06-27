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

  late final _$listaProdutosFavoritosAtom =
      Atom(name: '_ProdutoStore.listaProdutosFavoritos', context: context);

  @override
  ObservableList<ProductsModel> get listaProdutosFavoritos {
    _$listaProdutosFavoritosAtom.reportRead();
    return super.listaProdutosFavoritos;
  }

  @override
  set listaProdutosFavoritos(ObservableList<ProductsModel> value) {
    _$listaProdutosFavoritosAtom
        .reportWrite(value, super.listaProdutosFavoritos, () {
      super.listaProdutosFavoritos = value;
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

  late final _$categoriasPendentesCarregandoAtom = Atom(
      name: '_ProdutoStore.categoriasPendentesCarregando', context: context);

  @override
  bool get categoriasPendentesCarregando {
    _$categoriasPendentesCarregandoAtom.reportRead();
    return super.categoriasPendentesCarregando;
  }

  @override
  set categoriasPendentesCarregando(bool value) {
    _$categoriasPendentesCarregandoAtom
        .reportWrite(value, super.categoriasPendentesCarregando, () {
      super.categoriasPendentesCarregando = value;
    });
  }

  late final _$categoriasPendentesCarregadoAtom = Atom(
      name: '_ProdutoStore.categoriasPendentesCarregado', context: context);

  @override
  bool get categoriasPendentesCarregado {
    _$categoriasPendentesCarregadoAtom.reportRead();
    return super.categoriasPendentesCarregado;
  }

  @override
  set categoriasPendentesCarregado(bool value) {
    _$categoriasPendentesCarregadoAtom
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

  late final _$_ProdutoStoreActionController =
      ActionController(name: '_ProdutoStore', context: context);

  @override
  void salvarFavorito(ProductsModel favorito) {
    final _$actionInfo = _$_ProdutoStoreActionController.startAction(
        name: '_ProdutoStore.salvarFavorito');
    try {
      return super.salvarFavorito(favorito);
    } finally {
      _$_ProdutoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerFavorito(ProductsModel favorito) {
    final _$actionInfo = _$_ProdutoStoreActionController.startAction(
        name: '_ProdutoStore.removerFavorito');
    try {
      return super.removerFavorito(favorito);
    } finally {
      _$_ProdutoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantidade: ${quantidade},
listaProdutosFavoritos: ${listaProdutosFavoritos},
listaProdutos: ${listaProdutos},
produtosPendentesCarregando: ${produtosPendentesCarregando},
produtosPendentesCarregado: ${produtosPendentesCarregado},
errorMessage: ${errorMessage},
listaCategorias: ${listaCategorias},
categoriasPendentesCarregando: ${categoriasPendentesCarregando},
categoriasPendentesCarregado: ${categoriasPendentesCarregado}
    ''';
  }
}
