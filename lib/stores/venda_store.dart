
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

  _VendaStore() {
    _useCasesVenda = GetIt.I.get<UseCasesVenda>();
    autorun(
      (_) {},
    );
  }

    @observable
  ObservableList<VendaModel> carrinho = ObservableList<VendaModel>();

  @observable
  ObservableFuture<List<VendaModel>>? _vendaPendente;


  @observable
  bool vendaPendenteCarregando = false;

  @observable
  bool vendaPendenteCarregado = false;

  @observable
  String errorMessage = '';

    @action
  Future<void> obterCarrinho() async {
    try {
      errorMessage = ''; //reseta a mensagem de erro

      vendaPendenteCarregando = true;
      vendaPendenteCarregado = false;

      List<VendaModel> listaDeVenda = [];

      _vendaPendente = ObservableFuture( _useCasesVenda.pegarCarrinho());

      listaDeVenda = await _vendaPendente!;

      do {
        if (_vendaPendente!.status == FutureStatus.fulfilled) {
          if (errorMessage == '') {
            carrinho.clear();
            carrinho.addAll(listaDeVenda);

            vendaPendenteCarregado = true;
            vendaPendenteCarregando = false;
          }
        }
      } while (vendaPendenteCarregado != true || errorMessage != '');
    } catch (e) {
      vendaPendenteCarregado = false;
      vendaPendenteCarregando = false;
      errorMessage = e.toString();
    }
  }


    salvarProdutosCarrinho({required int id,required int quantidade})async{

      try {
        errorMessage = ''; //reseta a mensagem de erro

        vendaPendenteCarregando = true;
        vendaPendenteCarregado = false;

        List<VendaModel> listaDeVenda = [];

        _vendaPendente = ObservableFuture( _useCasesVenda.salvarProdutoCarrinho(id: id, quantidade: quantidade));

        listaDeVenda = await _vendaPendente!;

        do {
          if (_vendaPendente!.status == FutureStatus.fulfilled) {
            if (errorMessage == '') {
              carrinho.clear();
              carrinho.addAll(listaDeVenda);

              vendaPendenteCarregado = true;
              vendaPendenteCarregando = false;
            }
          }
        } while (vendaPendenteCarregado != true || errorMessage != '');
      } catch (e) {
        vendaPendenteCarregado = false;
        vendaPendenteCarregando = false;
        errorMessage = e.toString();
      }
    }

}
