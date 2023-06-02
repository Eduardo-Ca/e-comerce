import 'package:dartz/dartz.dart';
import 'package:ecomerce/modules/core/errors/failures.dart';
import 'package:ecomerce/modules/produtos/data/datasource/produto_datasource_abst.dart';
import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';
import 'package:ecomerce/modules/produtos/domain/repositories/produto_domain_repository.dart';

class ProdutoRepository implements IProdutoRepository {
  final IProdutoDatasource dataSource;
  ProdutoRepository(this.dataSource);

  @override
  Future<Either<Failure, List<ProductsModel>>> obterTodosProdutos(String? valorPesquisa,String? categoria) async {
    return await dataSource.obterTodosProdutos(valorPesquisa,categoria);
  }
  @override
  Future<Either<Failure, List<String>>> obterTodasCategorias() async {
    return await dataSource.obterTodasCategorias();
  }


}

  
