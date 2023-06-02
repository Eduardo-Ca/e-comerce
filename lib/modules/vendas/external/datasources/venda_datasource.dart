// ignore_for_file: unused_import, non_constant_identifier_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecomerce/modules/core/errors/failures.dart';
import 'package:ecomerce/modules/core/utils/configuracao_api/request_util.dart';
import 'package:ecomerce/modules/core/utils/constants/request_constante.dart';
import 'package:ecomerce/modules/vendas/data/datasource/venda_datasource_abst/venda_datasource_abst.dart';
import 'package:ecomerce/modules/vendas/data/models/venda_model.dart';


RequestUtil _request = RequestUtil();

class ApiVendaDatasource implements IVendaDatasource {
 

   @override
  Future<Either<ServerFailure, List<VendaModel>>> pegarCarrinho() async {
    dynamic retorno = await _request.fazRequestNovo(method: Request.GET,endpoint: Endpoints.GET_CARRINHO,data: null,);

    List<VendaModel> carrinho = [];

    carrinho.add(VendaModel.fromJson(retorno.data)); 

    if (_request.response.statusCode != 200 && _request.response.statusCode != 201) {
      return Left(ServerFailure(
          erroCodigo: 'Server Erro: ${_request.response.statusCode}',
          erroDescricao: _request.response.data['MsgErro']));
    } else {
      return Right(carrinho);
    }
  } 

     @override
  Future<Either<ServerFailure, List<VendaModel>>> salvarProdutoCarrinho({required int id,required int quantidade}) async {
    dynamic retorno = await _request.fazRequestNovo(method: Request.PUT,endpoint: Endpoints.SALVAR_PRODUTO_NO_CARRINHO,
      data: {
          "merge": true,
          "products": [
            {
              "id": id,
              "quantity":quantidade
            }
          ],
        
        },
        dataParameters: {
           "merge": true,
          "products": [
            {
              "id": id,
              "quantity":quantidade
            }
          ],
        
        },
        sincronizando: true);

    List<VendaModel> carrinho = [];

    carrinho.add(VendaModel.fromJson(retorno.data)); 

    if (_request.response.statusCode != 200 && _request.response.statusCode != 201) {
      return Left(ServerFailure(
          erroCodigo: 'Server Erro: ${_request.response.statusCode}',
          erroDescricao: _request.response.data['MsgErro']));
    } else {
      return Right(carrinho);
    }
  } 
}
