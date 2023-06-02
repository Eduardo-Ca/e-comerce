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
//==================================== LISTA PRODUTOS ===========================================================
  @observable
  ObservableList<ProductsModel> listaProdutos = ObservableList<ProductsModel>();

  @observable
  ObservableFuture<List<ProductsModel>>? _produtosPendentes;

  @observable
  bool produtosPendentesCarregando = false;

  @observable
  bool produtosPendentesCarregado = false;

  @observable
  String errorMessage = '';

    @action
  Future<void> obterProdutos(String? valorPesquisa,String? categoria) async {
    try {
      errorMessage = ''; //reseta a mensagem de erro

      produtosPendentesCarregando = true;
      produtosPendentesCarregado = false;

      List<ProductsModel> listaDeProdutos = [];

      _produtosPendentes = ObservableFuture( _useCasesProdutos.obterTodosProdutos(valorPesquisa,categoria));

      listaDeProdutos = await _produtosPendentes!;

      do {
        if (_produtosPendentes!.status == FutureStatus.fulfilled) {
          if (errorMessage == '') {
            listaProdutos.clear();
            listaProdutos.addAll(listaDeProdutos);

            produtosPendentesCarregado = true;
            produtosPendentesCarregando = false;
          }
        }
      } while (produtosPendentesCarregado != true || errorMessage != '');
    } catch (e) {
      produtosPendentesCarregado = false;
      produtosPendentesCarregando = false;
      errorMessage = e.toString();
    }
  }

  
//==================================== LISTA PRODUTOS ===========================================================
//==================================== LISTA CATEGORIAS ===========================================================

   @observable
  ObservableList<String> listaCategorias = ObservableList<String>();

  @observable
  ObservableFuture<List<String>>? _categoriasPendentes;

  @observable
  bool categoriasPendentesCarregando = false;

  @observable
  bool categoriasPendentesCarregado = false;

    @action
  Future<void> obterCategorias() async {
    try {
      errorMessage = ''; //reseta a mensagem de erro

      categoriasPendentesCarregando = true;
      categoriasPendentesCarregado = false;

      List<String> listaDeCategorias = [];

      _categoriasPendentes = ObservableFuture( _useCasesProdutos.obterTodasCategorias());

      listaDeCategorias = await _categoriasPendentes!;

      do {
        if (_categoriasPendentes!.status == FutureStatus.fulfilled) {
          if (errorMessage == '') {
            listaCategorias.clear();
            listaCategorias.addAll(listaDeCategorias);

            categoriasPendentesCarregado = true;
            categoriasPendentesCarregando = false;
          }
        }
      } while (categoriasPendentesCarregado != true || errorMessage != '');
    } catch (e) {
      categoriasPendentesCarregado = false;
      categoriasPendentesCarregando = false;
      errorMessage = e.toString();
    }
  }
//==================================== LISTA CATEGORIAS ===========================================================
}
