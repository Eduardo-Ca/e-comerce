import 'package:dartz/dartz.dart';
import 'package:ecomerce/modules/core/errors/failures.dart';
import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';

abstract class IProdutoRepository {
  Future<Either<Failure, List<ProductsModel>>> obterTodosProdutos();
}
