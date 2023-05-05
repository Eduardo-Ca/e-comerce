import 'package:dio/dio.dart';
import 'package:ecomerce/modules/vendas/data/models/venda_model.dart';

abstract class IUsecasesVenda {
  Future<Response> salvarCarrinho(idProduto,quantidade);
  Future< List<VendaModel>> pegarCarrinho();
}
