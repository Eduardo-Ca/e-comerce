import 'package:ecomerce/modules/home/home_tela.dart';
import 'package:ecomerce/modules/usuario/presenter/usuario_tela.dart/usuario_tela.dart';
import 'package:ecomerce/modules/vendas/presenter/carrinho_tela.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  // o bottomAppBar usa do tab e telas atuais para mostrar em que tela está
  int tabAtual = 0;
  final List<Widget> telas = const [
    HomeTela(), //tab 0
    UsuarioTela(), // tab 1
    CarrinhoTela(), //tab 2
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget telaAtual = const HomeTela();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: telaAtual,
      ),
//!=========== botâo flutuante do meio =================

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () {
          setState(() {
            telaAtual = const HomeTela();
          tabAtual = 0;
          });
          
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
//!============== icones da esquerda ==============
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 35,
                    ),
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          telaAtual = const CarrinhoTela();
                          tabAtual = 2;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: tabAtual == 2
                                  ? Colors.orangeAccent
                                  : Colors.grey,
                            ),
                            Text(
                              "Carrinho",
                              style: TextStyle(
                                  color: tabAtual == 2
                                      ? Colors.orangeAccent
                                      : Colors.grey),
                            ),
                          ]),
                    ),
                  ],
                ),

//!============== icones da direita ============
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          telaAtual = const UsuarioTela();
                          tabAtual = 1;
                        });
                      },
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: tabAtual == 1
                                  ? Colors.orangeAccent
                                  : Colors.grey,
                            ),
                            Text(
                              "Usuário",
                              style: TextStyle(
                                  color: tabAtual == 1
                                      ? Colors.orangeAccent
                                      : Colors.grey),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      width: 35,
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
