// ignore_for_file: unused_import

import 'package:dartz/dartz.dart';
import 'package:ecomerce/modules/core/errors/failures.dart';
import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';

abstract class IProdutoDatasource {
  Future<Either<Failure, List<ProductsModel>>> obterTodosProdutos(String? valorPesquisa,String? categoria);
  Future<Either<Failure, List<String>>> obterTodasCategorias();
 
}
