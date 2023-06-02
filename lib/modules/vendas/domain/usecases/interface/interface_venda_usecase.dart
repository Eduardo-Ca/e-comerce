import 'package:ecomerce/modules/vendas/data/models/venda_model.dart';

abstract class IUsecasesVenda {
  Future< List<VendaModel>> pegarCarrinho();
  Future< List<VendaModel>> salvarProdutoCarrinho({required int id,required int quantidade});
}
