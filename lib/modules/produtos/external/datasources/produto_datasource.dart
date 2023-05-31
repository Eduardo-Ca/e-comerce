import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecomerce/modules/core/errors/failures.dart';
import 'package:ecomerce/modules/core/utils/configuracao_api/request_util.dart';
import 'package:ecomerce/modules/core/utils/constants/request_constante.dart';
import 'package:ecomerce/modules/produtos/data/datasource/produto_datasource_abst.dart';
import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';


RequestUtil _request = RequestUtil();

class ProdutoDatasource implements IProdutoDatasource {
 
  @override
  Future<Either<ServerFailure, List<ProductsModel>>> obterTodosProdutos(String? valorPesquisa,String? categoria) async {
    dynamic retorno = await _request.fazRequestNovo(method: Request.GET,endpoint:categoria == null? valorPesquisa == null ? Endpoints.GET_TODOS_PRODUTOS : "${Endpoints.GET_TODOS_PRODUTOS}/search?q=$valorPesquisa": "${Endpoints.GET_TODOS_PRODUTOS}/category/$categoria" ,data: null,);

    List<ProductsModel> lista = [];

    //print( retorno.data);
    retorno.data['products'].forEach((v) {
       lista.add(ProductsModel.fromJson(v)); 
    });

    if (_request.response.statusCode != 200 && _request.response.statusCode != 201) {
      return Left(ServerFailure(
          erroCodigo: 'Server Erro: ${_request.response.statusCode}',
          erroDescricao: _request.response.data['MsgErro']));
    } else {
      return Right(lista);
    }
  }

    @override
  Future<Either<ServerFailure, List<String>>> obterTodasCategorias() async {
    Response<dynamic> retorno = await _request.fazRequestNovo(method: Request.GET,endpoint: Endpoints.GET_CATEGORIAS,data: null,);

    
    List<String> lista = [];
   
   retorno.data.forEach((e) { 
     lista.add(e.toString());
   });

    if (_request.response.statusCode != 200 && _request.response.statusCode != 201) {
      return Left(ServerFailure(
          erroCodigo: 'Server Erro: ${_request.response.statusCode}',
          erroDescricao: _request.response.data['MsgErro']));
    } else {
      return Right(lista);
    }
  }

   @override
  Future<dynamic> salvarProdutoCarrinho({required int id,required int quantidade}) async {

    var idJson = jsonEncode(id);
    var quantidadeJson = jsonEncode(quantidade);
    dynamic retorno = await _request.fazRequestNovo(
        method: Request.PUT,
        endpoint: Endpoints.SALVAR_PRODUTO_NO_CARRINHO,
        data: {
          "merge": true,
          "products": [
            {
              "id": idJson,
              "quantity":quantidadeJson
            }
          ],
        
        },
        dataParameters: {
           "merge": true,
          "products": [
            {
              "id": idJson,
              "quantity":quantidadeJson
            }
          ],
        
        },
        sincronizando: true);
  

    return retorno;
  }
 
}
