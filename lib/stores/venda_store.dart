
import 'package:ecomerce/modules/vendas/data/models/venda_model.dart';
import 'package:ecomerce/modules/vendas/domain/usecases/venda_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'venda_store.g.dart';
//flutter pub run build_runner build
//flutter pub run build_runner build --delete-conflicting-outputs
// ignore: library_private_types_in_public_api
class VendaStore = _VendaStore with _$VendaStore;

abstract class _VendaStore with Store {

 late UseCasesVenda _useCasesVenda;

  _ProdutoStore() {
    _useCasesVenda = GetIt.I.get<UseCasesVenda>();
    autorun(
      (_) {},
    );
  }

   @observable
  int quantidade = 1;

  @observable
  VendaModel venda = VendaModel(id:1, produtos: [], total: 0, discountedTotal: 0, userId: 1, totalProducts: 0, totalQuantity: 0);

  @observable
  late Future<VendaModel> _vendaPendente;

  @observable
  bool _vendaPendenteCarregando = false;

  @observable
  bool _vendaPendenteCarregado = false;

  @observable
  String errorMessage = '';

    @action
  Future<void> obterCarrinho() async {
    try {
      errorMessage = ''; //reseta a mensagem de erro

      _vendaPendenteCarregando = true;
      _vendaPendenteCarregado = false;

      VendaModel carrinho = VendaModel(id:1, produtos: [], total: 0, discountedTotal: 0, userId: 1, totalProducts: 0, totalQuantity: 0);

      _vendaPendente = ObservableFuture( _useCasesVenda.pegarCarrinho());

      carrinho = await _vendaPendente;

      do {
       
      } while (_vendaPendenteCarregado != true || errorMessage != '');
    } catch (e) {
      _vendaPendenteCarregado = false;
      _vendaPendenteCarregando = false;
      errorMessage = e.toString();
    }
  }
}
