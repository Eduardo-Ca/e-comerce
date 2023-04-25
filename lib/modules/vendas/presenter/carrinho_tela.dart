import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:ecomerce/modules/vendas/domain/usecases/venda_usecase.dart';
import 'package:ecomerce/stores/venda_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarrinhoTela extends StatefulWidget {
  const CarrinhoTela({super.key});

  @override
  State<CarrinhoTela> createState() => _CarrinhoTelaState();
}

class _CarrinhoTelaState extends State<CarrinhoTela> {

  late UseCasesVenda useCasesVenda;
  late VendaStore store;

  @override
  void didChangeDependencies() {
    store = Provider.of<VendaStore>(context);
    store.obterCarrinho();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 28.0),
          child: Center(
              child: Text(
            MensagensConstantes.CARRINHO,
            style: TextStyle(color: Colors.white, fontSize: 26),
          )),
        ),
        bottom: PreferredSize(
            preferredSize: const Size(15, 15), child: Container()),
       
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xffca485c),
                  Color(0xffe16b5c),
                  Color(0xfff39060),
                  Color(0xffffb56b),
                ]),
          ),
        ),
      ),
      body: Text("${store.venda.produtos}"),
    );
  }
}
