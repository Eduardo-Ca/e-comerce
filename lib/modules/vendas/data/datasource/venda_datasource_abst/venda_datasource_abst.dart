// ignore_for_file: unused_import

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecomerce/modules/core/errors/failures.dart';
import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';
import 'package:ecomerce/modules/vendas/data/models/venda_model.dart';

abstract class IVendaDatasource {
  Future<Either<Failure, List<VendaModel>>>  pegarCarrinho();
}
