import 'package:dartz/dartz.dart';
import 'package:ecomerce/modules/core/errors/failures.dart';
import 'package:ecomerce/modules/vendas/data/models/venda_model.dart';

abstract class IVendaRepository {
  Future<Either<Failure, List<VendaModel>>> pegarCarrinho();
  Future<Either<Failure, List<VendaModel>>>  salvarProdutoCarrinho({required int id,required int quantidade});
}
