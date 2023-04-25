import 'package:ecomerce/modules/produtos/data/repositories/produto_repository.dart';
import 'package:ecomerce/modules/produtos/domain/usecases/produto_usecase.dart';
import 'package:ecomerce/modules/produtos/external/datasources/produto_datasource.dart';
import 'package:ecomerce/modules/vendas/data/repositories/venda_repository.dart';
import 'package:ecomerce/modules/vendas/domain/usecases/venda_usecase.dart';
import 'package:ecomerce/modules/vendas/external/datasources/venda_datasource.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

void setupLocator() {
  //=========================================== Produtos ======================================================================
  getIt.registerLazySingleton<ProdutoDatasource>(
      () => ProdutoDatasource());
  getIt.registerLazySingleton<ProdutoRepository>(
      () => ProdutoRepository(GetIt.I.get<ProdutoDatasource>()));

  getIt.registerLazySingleton<UseCasesProduto>(
      () => UseCasesProduto(GetIt.I.get<ProdutoRepository>()));
  //=========================================== Produtos =====================================================================

    //=========================================== Vendas ======================================================================
  getIt.registerLazySingleton<ApiVendaDatasource>(
      () => ApiVendaDatasource());
  getIt.registerLazySingleton<VendaRepository>(
      () => VendaRepository(GetIt.I.get<ApiVendaDatasource>()));

  getIt.registerLazySingleton<UseCasesVenda>(
      () => UseCasesVenda(GetIt.I.get<VendaRepository>()));
  //=========================================== Vendas =====================================================================
}
