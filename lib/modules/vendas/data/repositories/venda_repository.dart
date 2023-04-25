import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecomerce/modules/core/errors/failures.dart';
import 'package:ecomerce/modules/vendas/data/datasource/venda_datasource_abst/venda_datasource_abst.dart';
import 'package:ecomerce/modules/vendas/data/models/venda_model.dart';
import 'package:ecomerce/modules/vendas/domain/repositories/venda_domain_repository.dart';

class VendaRepository implements IVendaRepository {
  final IVendaDatasource dataSource;
  VendaRepository(this.dataSource);

  @override
  Future<Either<Failure, Response>> salvarCarrinho(idProduto,quantidade) async {
    return await dataSource.salvarCarrinho(idProduto,quantidade);
  }

  @override
  Future<Either<Failure,VendaModel>> pegarCarrinho() async {
    return await dataSource.pegarCarrinho();
  }
}
