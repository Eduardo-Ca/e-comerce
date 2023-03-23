import 'package:ecomerce/modules/usuario/presenter/usuario_tela.dart/components/opcoes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UsuarioTela extends StatefulWidget {
  const UsuarioTela({super.key});

  @override
  State<UsuarioTela> createState() => _UsuarioTelaState();
}

class _UsuarioTelaState extends State<UsuarioTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _fundo(context),
            _cardUsuario(context),
            _fotoUsuario(),
          ],
        ),
      ),
    );
  }
}

_fotoUsuario() {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: 130,
        height: 130,
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(
              color: Color(0xfff39060),
              width: 3,
            ),
          ),
          child: const Icon(
            Icons.people,
            size: 80,
          ),
        ),
      ),
    ),
  );
}

_cardUsuario(context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(
        top: 70.0,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.1,
        height: MediaQuery.of(context).size.height / 1.37,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const Padding(
                padding: EdgeInsets.only(top: 80.0, bottom: 10),
                child: Text(
                  "Usuário",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                thickness: 1.6,
              ),
              opcoes(texto: "Sair", funcao: (){print("clico");})
            ],
          ),
        ),
      ),
    ),
  );
}

_fundo(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height / 3,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0)),
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
  );
}

PreferredSize _appBar() {
  return PreferredSize(
      child: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      preferredSize: const Size.fromHeight(0));
}
