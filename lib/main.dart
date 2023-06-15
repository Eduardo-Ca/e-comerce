
import 'dart:io';

import 'package:ecomerce/modules/core/utils/compartilhados/auth_check.dart';
import 'package:ecomerce/modules/core/utils/constants/tema_constante.dart';
import 'package:ecomerce/service_locator.dart';
import 'package:ecomerce/services/auth_service.dart';
import 'package:ecomerce/stores/produto_store.dart';
import 'package:ecomerce/stores/venda_store.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
    await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB-eEpyOIdSM9xouzwDRlUGvCL7Cm4rtdo",
      appId: "1:179849072839:android:b1ac541e312e8dc247eee2",
      messagingSenderId: "179849072839",
      projectId: "ecomerce-teste",
    ),
  )
  :await Firebase.initializeApp();

  setupLocator();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthService(),),
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
      home: const AuthCheck(),
    );
  }
}

