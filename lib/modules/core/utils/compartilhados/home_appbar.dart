import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:ecomerce/modules/home/presenter/home_tela.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                botaoCarrinho(),
                botaoHome(),
                botaoUsuario()
              ],
            ),
          )),
    );
  }

  botaoHome() {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          telaAtual = const HomeTela();
          tabAtual = 0;
        });
      },
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.home,
          color: tabAtual == 0 ? Colors.orangeAccent : Colors.grey,
        ),
        Text(
          MensagensConstantes.HOME,
          style: TextStyle(
              color: tabAtual == 0 ? Colors.orangeAccent : Colors.grey),
        ),
      ]),
    );
  }

  botaoUsuario() {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          telaAtual = const UsuarioTela();
          tabAtual = 1;
        });
      },
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.person,
          color: tabAtual == 1 ? Colors.orangeAccent : Colors.grey,
        ),
        Text(
          MensagensConstantes.USUARIO,
          style: TextStyle(
            color: tabAtual == 1 ? Colors.orangeAccent : Colors.grey),
        ),
      ]),
    );
  }

  botaoCarrinho() {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        setState(() {
          telaAtual = const CarrinhoTela();
          tabAtual = 2;
        });
      },
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.shopping_cart,
          color: tabAtual == 2 ? Colors.orangeAccent : Colors.grey,
        ),
        Text(
          MensagensConstantes.CARRINHO,
          style: TextStyle(
            color: tabAtual == 2 ? Colors.orangeAccent : Colors.grey),
        ),
      ]),
    );
  }
}
