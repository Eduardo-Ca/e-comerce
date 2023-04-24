import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';

abstract class IUsecasesProduto {
  Future<List<ProductsModel>> obterTodosProdutos();
}
