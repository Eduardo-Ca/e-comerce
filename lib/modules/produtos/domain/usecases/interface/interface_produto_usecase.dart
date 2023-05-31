import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';

abstract class IUsecasesProduto {
  Future<List<ProductsModel>> obterTodosProdutos(String? valorPesquisa,String? categoria);
  Future<List<String>> obterTodasCategorias();
  Future<dynamic> salvarProdutoCarrinho({required int id,required int quantidade});
}
