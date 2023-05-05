import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecomerce/modules/core/errors/failures.dart';
import 'package:ecomerce/modules/vendas/data/models/venda_model.dart';

abstract class IVendaRepository {
  Future<Either<Failure, Response>> salvarCarrinho(idProduto,quantidade);
  Future<Either<Failure, List<VendaModel>>> pegarCarrinho();
}
