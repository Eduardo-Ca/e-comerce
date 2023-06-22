import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:ecomerce/modules/usuario/presenter/login_tela/login_tela.dart';
import 'package:ecomerce/modules/usuario/presenter/usuario_tela.dart/components/opcoes.dart';
import 'package:ecomerce/services/auth_service.dart';
import 'package:ecomerce/stores/formulario.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class UsuarioTela extends StatefulWidget {
  const UsuarioTela({super.key});

  @override
  State<UsuarioTela> createState() => _UsuarioTelaState();
}

class _UsuarioTelaState extends State<UsuarioTela> {
  final loginStore = formularioStore();

   late AuthService auth;
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    auth = Provider.of<AuthService>(context);
  }


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
              Padding(
                padding: const EdgeInsets.only(top: 80.0, bottom: 10),
                child: Text(
                  auth.usuario!.email!,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                  thickness: 1.6,
                ),
                opcoes(texto: "teste", funcao: (){}),
                opcoes(texto: MensagensConstantes.SAIR, funcao: (){
                  auth.logout();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const Login()), (Route<dynamic> route) => false);
                },
              ),
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
      preferredSize: const Size.fromHeight(0),
      child: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
    );
}

}

