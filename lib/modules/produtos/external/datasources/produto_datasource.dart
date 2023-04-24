import 'package:dartz/dartz.dart';
import 'package:ecomerce/modules/core/errors/failures.dart';
import 'package:ecomerce/modules/core/utils/configuracao_api/request_util.dart';
import 'package:ecomerce/modules/core/utils/constants/request_constante.dart';
import 'package:ecomerce/modules/produtos/data/datasource/produto_datasource_abst.dart';
import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';


RequestUtil _request = RequestUtil();

class ProdutoDatasource implements IProdutoDatasource {
 
  @override
  Future<Either<ServerFailure, List<ProductsModel>>> obterTodosProdutos() async {
    dynamic retorno = await _request.fazRequestNovo(method: Request.GET,endpoint: Endpoints.GET_TODOS_PRODUTOS,data: null,);

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
}
