import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:ecomerce/modules/home/components/homeCard.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeTela extends StatefulWidget {
  const HomeTela({super.key});

  @override
  State<HomeTela> createState() => _HomeTelaState();
}

class _HomeTelaState extends State<HomeTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 28.0),
          child: Center(
              child: Text(
            MensagensConstantes.HOME,
            style: TextStyle(color: Colors.white, fontSize: 26),
          )),
        ),
        bottom: PreferredSize(
            preferredSize: const Size(30, 30), child: Container()),
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
      body: Column(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeCard(
                  texto: MensagensConstantes.SAPATOS, icone: MdiIcons.shoeSneaker, funcao: () {}),
              HomeCard(
                  texto: MensagensConstantes.CAMISAS, icone: MdiIcons.tshirtCrew, funcao: () {}),
              HomeCard(
                  texto: MensagensConstantes.ACESSORIOS,
                  icone: MdiIcons.sunglasses,
                  funcao: () {}),
              HomeCard(
                  texto: MensagensConstantes.COMESTICOS,
                  icone: MdiIcons.lipstick,
                  funcao: () {}),
            ],
          ),
        )
      ]),
    );
  }
}
