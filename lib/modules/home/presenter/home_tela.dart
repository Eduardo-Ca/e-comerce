// ignore_for_file: prefer_const_constructors

import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:ecomerce/modules/home/presenter/components/home_card.dart';
import 'package:ecomerce/modules/home/presenter/components/produtos_card.dart';
import 'package:ecomerce/modules/produtos/domain/usecases/produto_usecase.dart';
import 'package:ecomerce/modules/produtos/presenter/detalhes_produto.dart';
import 'package:ecomerce/stores/produto_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class HomeTela extends StatefulWidget {
  const HomeTela({super.key});

  @override
  State<HomeTela> createState() => _HomeTelaState();
}

class _HomeTelaState extends State<HomeTela> {

  late ProdutoStore store;
  late UseCasesProduto useCasesProduto;
  late double tamanhoTela;
  late double larguraTela;

  @override
  void didChangeDependencies() {
    store = Provider.of<ProdutoStore>(context);
    store.obterProdutos();
    tamanhoTela = MediaQuery.of(context).size.height;
    larguraTela = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }
  

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
      body: Column(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: _cards(),
        ),
        SizedBox(height: 20,),
        listaDeProdutos()
      ]),
    );
  }

  _cards(){
    return Row(
      children: [
        HomeCard(
            texto: MensagensConstantes.TODOS,
            icone: MdiIcons.bookmarkBox,
            funcao: () {
              
            }),
        HomeCard(
            texto: MensagensConstantes.SAPATOS,
            icone: MdiIcons.shoeSneaker,
            funcao: () {}),
        HomeCard(
            texto: MensagensConstantes.CAMISAS,
            icone: MdiIcons.tshirtCrew,
            funcao: () {}),
        HomeCard(
            texto: MensagensConstantes.ACESSORIOS,
            icone: MdiIcons.sunglasses,
            funcao: () {}),
        HomeCard(
            texto: MensagensConstantes.COMESTICOS,
            icone: MdiIcons.lipstick,
            funcao: () {}),
      ],
    );
  }

  listaDeProdutos(){
    return Observer(builder: (context) {
      if (store.listaProdutos.isEmpty) {
        return Row(
        
          children: const [
            Icon(
              Icons.star,
              color: Color(0xffca485c),
            ), 
            Text(
              MensagensConstantes.SEM_PRODUTOS,
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.star,
              color: Color(0xffca485c),
            ),
          ],
        );
      } else {
        return  SizedBox(
          width: larguraTela-70,
          height: tamanhoTela/1.7,
          child: ListView.builder(
            //scrollDirection: Axis.horizontal,
            controller: ScrollController(),
            shrinkWrap: true,
            itemCount: store.listaProdutos.length,
            itemBuilder: (context, index) {
              var item = store.listaProdutos[index];
              return ListTile(
                //!=== Card ===
                title: ProdutosCard(produto: item),
                onTap: (() {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => ProdutoDetalhes(item: item,)));
                }),
              );
            },
           
          ),
        );
      }
    });
  }
}
