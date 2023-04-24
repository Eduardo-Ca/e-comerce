
import 'package:ecomerce/modules/core/utils/constants/tema_constante.dart';
import 'package:ecomerce/modules/usuario/presenter/bem_vindo_tela/bem_vindo_tela.dart';
import 'package:ecomerce/service_locator.dart';
import 'package:ecomerce/stores/produto_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();

  runApp(MultiProvider(
    providers: [
      Provider<ProdutoStore>(create: (_) => ProdutoStore(), ),
    
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce',
      theme: temaClaro,
      darkTheme: temaEscuro,
      home: const BemVindoTela(),
    );
  }
}

