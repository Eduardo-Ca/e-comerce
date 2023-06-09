
import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';
import 'package:ecomerce/modules/vendas/data/models/venda_model.dart';
import 'package:mobx/mobx.dart';

part 'venda_store.g.dart';
//flutter pub run build_runner build
//flutter pub run build_runner build --delete-conflicting-outputs
// ignore: library_private_types_in_public_api
class VendaStore = _VendaStore with _$VendaStore;

abstract class _VendaStore with Store {

  @observable
  VendaModel carrinho = VendaModel(id: 1, products:const [] , total: 0, discountedTotal: 0, userId: 1, totalProducts: 0, totalQuantity: 0);
  
  @observable
  int total = 0;

  @observable
  ObservableList<ProductsModel> produtos = ObservableList<ProductsModel>.of([]);

  @action
  void salvarProdutosCarrinho({required ProductsModel produto})async{
    produtos.add(produto);
    carrinho.products = produtos;

  }

  @action
  void removerProdutosCarrinho({required ProductsModel produto})async{
    produtos.remove(produto);
    carrinho.products = produtos;
    calcularTotal();
  }

  @action
  void calcularTotal()async{
    total = 0;
    carrinho.total = 0;
    for (var e in carrinho.products) { 
      e.priceTotal = e.price! * e.quantity!;
      total += e.priceTotal!;
    }
    carrinho.total = total;
  }
}
