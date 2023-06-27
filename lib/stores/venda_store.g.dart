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
  VendaModel get carrinho {
    _$carrinhoAtom.reportRead();
    return super.carrinho;
  }

  @override
  set carrinho(VendaModel value) {
    _$carrinhoAtom.reportWrite(value, super.carrinho, () {
      super.carrinho = value;
    });
  }

  late final _$totalAtom = Atom(name: '_VendaStore.total', context: context);

  @override
  int get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(int value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  late final _$produtosAtom =
      Atom(name: '_VendaStore.produtos', context: context);

  @override
  ObservableList<ProductsModel> get produtos {
    _$produtosAtom.reportRead();
    return super.produtos;
  }

  @override
  set produtos(ObservableList<ProductsModel> value) {
    _$produtosAtom.reportWrite(value, super.produtos, () {
      super.produtos = value;
    });
  }

  late final _$_VendaStoreActionController =
      ActionController(name: '_VendaStore', context: context);

  @override
  void salvarProdutosCarrinho({required ProductsModel produto}) {
    final _$actionInfo = _$_VendaStoreActionController.startAction(
        name: '_VendaStore.salvarProdutosCarrinho');
    try {
      return super.salvarProdutosCarrinho(produto: produto);
    } finally {
      _$_VendaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerProdutosCarrinho({required ProductsModel produto}) {
    final _$actionInfo = _$_VendaStoreActionController.startAction(
        name: '_VendaStore.removerProdutosCarrinho');
    try {
      return super.removerProdutosCarrinho(produto: produto);
    } finally {
      _$_VendaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void calcularTotal() {
    final _$actionInfo = _$_VendaStoreActionController.startAction(
        name: '_VendaStore.calcularTotal');
    try {
      return super.calcularTotal();
    } finally {
      _$_VendaStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
carrinho: ${carrinho},
total: ${total},
produtos: ${produtos}
    ''';
  }
}
