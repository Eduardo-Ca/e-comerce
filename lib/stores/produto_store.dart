import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';
import 'package:ecomerce/modules/produtos/domain/usecases/produto_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'produto_store.g.dart';
//flutter pub run build_runner build
//flutter pub run build_runner build --delete-conflicting-outputs
// ignore: library_private_types_in_public_api
class ProdutoStore = _ProdutoStore with _$ProdutoStore;

abstract class _ProdutoStore with Store {

 late UseCasesProduto _useCasesProdutos;

  _ProdutoStore() {
    _useCasesProdutos = GetIt.I.get<UseCasesProduto>();
    autorun(
      (_) {},
    );
  }

   @observable
  int quantidade = 1;

  @observable
  ObservableList<ProductsModel> listaProdutos = ObservableList<ProductsModel>();

  @observable
  ObservableFuture<List<ProductsModel>>? _produtosPendentes;

  @observable
  bool _produtosPendentesCarregando = false;

  @observable
  bool _produtosPendentesCarregado = false;

  @observable
  String errorMessage = '';

    @action
  Future<void> obterProdutos() async {
    try {
      errorMessage = ''; //reseta a mensagem de erro

      _produtosPendentesCarregando = true;
      _produtosPendentesCarregado = false;

      List<ProductsModel> listaDeProdutos = [];

      _produtosPendentes = ObservableFuture( _useCasesProdutos.obterTodosProdutos());

      listaDeProdutos = await _produtosPendentes!;

      do {
        if (_produtosPendentes!.status == FutureStatus.fulfilled) {
          if (errorMessage == '') {
            listaProdutos.clear();
            listaProdutos.addAll(listaDeProdutos);

            _produtosPendentesCarregado = true;
            _produtosPendentesCarregando = false;
          }
        }
      } while (_produtosPendentesCarregado != true || errorMessage != '');
    } catch (e) {
      _produtosPendentesCarregado = false;
      _produtosPendentesCarregando = false;
      errorMessage = e.toString();
    }
  }
}
