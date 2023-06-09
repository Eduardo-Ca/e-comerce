
import 'package:ecomerce/modules/core/utils/constants/tema_constante.dart';
import 'package:ecomerce/modules/usuario/presenter/login_tela/login_tela.dart';
import 'package:ecomerce/service_locator.dart';
import 'package:ecomerce/stores/produto_store.dart';
import 'package:ecomerce/stores/venda_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();

  runApp(MultiProvider(
    providers: [
      Provider<ProdutoStore>(create: (_) => ProdutoStore(), ),
      Provider<VendaStore>(create: (_) => VendaStore(), ),
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
      debugShowCheckedModeBanner: false,
      title: 'E-commerce',
      theme: temaClaro,
      darkTheme: temaEscuro,
      home: const Login(),
    );
  }
}

