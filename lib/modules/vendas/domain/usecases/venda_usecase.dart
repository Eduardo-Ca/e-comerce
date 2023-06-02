import 'package:ecomerce/modules/core/utils/tratar_either.dart';
import 'package:ecomerce/modules/vendas/data/models/venda_model.dart';
import 'package:ecomerce/modules/vendas/domain/repositories/venda_domain_repository.dart';
import 'package:ecomerce/modules/vendas/domain/usecases/interface/interface_venda_usecase.dart';

class UseCasesVenda extends IUsecasesVenda {
  final IVendaRepository repositoryRemoto;
  UseCasesVenda(this.repositoryRemoto);

   @override
  Future< List<VendaModel>> pegarCarrinho() async {
    final result = await repositoryRemoto.pegarCarrinho();

    if (result.isRight()) {
      return extrairInfoRight(result);
    }

    throw Exception(extrairInfoLeft(result));
  }

     @override
  Future< List<VendaModel>> salvarProdutoCarrinho({required int id,required int quantidade}) async {
    final result = await repositoryRemoto.salvarProdutoCarrinho(id:id,quantidade:quantidade);

    if (result.isRight()) {
      return extrairInfoRight(result);
    }

    throw Exception(extrairInfoLeft(result));
  }
}
