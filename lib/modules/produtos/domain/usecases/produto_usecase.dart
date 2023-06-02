import 'package:ecomerce/modules/core/utils/tratar_either.dart';
import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';
import 'package:ecomerce/modules/produtos/domain/repositories/produto_domain_repository.dart';
import 'package:ecomerce/modules/produtos/domain/usecases/interface/interface_produto_usecase.dart';

class UseCasesProduto extends IUsecasesProduto {
  final IProdutoRepository repositoryRemoto;
  UseCasesProduto(this.repositoryRemoto);

  @override
  Future<List<ProductsModel>> obterTodosProdutos(String? valorPesquisa,String? categoria) async {
    final result = await repositoryRemoto.obterTodosProdutos(valorPesquisa,categoria);

    if (result.isRight()) {
      return extrairInfoRight(result);
    }

    throw Exception(extrairInfoLeft(result));
  }

  
  @override
  Future<List<String>> obterTodasCategorias() async {
    final result = await repositoryRemoto.obterTodasCategorias();

    if (result.isRight()) {
      return extrairInfoRight(result);
    }

    throw Exception(extrairInfoLeft(result));
  }
  


 
}
