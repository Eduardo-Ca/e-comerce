// ignore_for_file: prefer_const_constructors

import 'package:ecomerce/modules/core/utils/compartilhados/busca.componente.dart';
import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:ecomerce/modules/home/presenter/components/categoria_card.dart';
import 'package:ecomerce/modules/home/presenter/components/produtos_card.dart';
import 'package:ecomerce/modules/produtos/domain/usecases/produto_usecase.dart';
import 'package:ecomerce/modules/produtos/presenter/detalhes_produto.dart';
import 'package:ecomerce/stores/produto_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeTela extends StatefulWidget {
  const HomeTela({super.key});

  @override
  State<HomeTela> createState() => _HomeTelaState();
}

class _HomeTelaState extends State<HomeTela> {

  late ProdutoStore store;
  late UseCasesProduto useCasesProduto;
  String? valorPesquisa = "";
  String? categoria;
  String categoriaSelecionado = "";
  late double tamanhoTela;
  late double larguraTela;
  final GlobalKey<BuscaComponenteState> _buscaKey = GlobalKey<BuscaComponenteState>();

  @override
  void didChangeDependencies() {
    store = Provider.of<ProdutoStore>(context);
    store.obterProdutos(valorPesquisa,categoria);
    store.obterCategorias();
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
        Flexible(
          flex: 2,
          child: _listaDeCategorias()),
        Flexible(
          flex: 2,
          child: _barraDePesquisa(), ),
        Expanded(
          flex: 9,
          child: _listaDeProdutos())
        
      ]),
    );
  }

  _listaDeCategorias(){
    return Observer(builder: (context) {
      if (store.listaCategorias.isEmpty) {
        return Container();
      } else {
        return  ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: ScrollController(),
          shrinkWrap: true,
          itemCount: store.listaCategorias.length,
          itemBuilder: (context, index) {
            var item = store.listaCategorias[index];
            return SizedBox(
              width: 160,
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                //!=== Card ===
                title: CategoriaCard(categoria: item,selecionado:categoriaSelecionado),
                onTap: (() {
                   categoria = item;
                   store.obterProdutos(valorPesquisa,categoria);
                   categoriaSelecionado = categoria!;
                   setState(() {});
                }),
              ),
            );
          },
        );
      }
    });
  }

  _listaDeProdutos(){
    return Observer(builder: (context) {
      if(store.produtosPendentesCarregando) {
        return Center(child: SizedBox(
          width: 100,
          child: CircularProgressIndicator())
          );
      }
      else if (store.listaProdutos.isEmpty) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.star,
              color: Colors.orange,
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
              color: Colors.orange,
            ),
          ],
        );
      } else {
        return  ListView.builder(
          scrollDirection: Axis.horizontal,
          controller: ScrollController(),
          shrinkWrap: true,
          itemCount: store.listaProdutos.length,
          itemBuilder: (context, index) {
            var item = store.listaProdutos[index];
            return SizedBox(
              height: 60,
              width: 240,
              child: ListTile(
                //!=== Card ===
                title: ProdutosCard(produto: item),
                onTap: (() {
                  FocusScope.of(context).unfocus();
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ProdutoDetalhes(item: item,)));
                }),
              ),
            );
          },
         
        );
      }
    });
  }

    _barraDePesquisa() {
    return BuscaComponente(
      textoBranco: false,
      teclado:TextInputType.text,
      cor: Colors.black,
      autoFocus: false,
      key: _buscaKey,
      placeholder: MensagensConstantes.PROCURAR,
      funcao: () {
        categoria = null;
        valorPesquisa = _buscaKey.currentState!.pesquisa;
        categoriaSelecionado = "";
        store.obterProdutos(valorPesquisa,categoria);
        setState(() {});

      },
    );
  }
}
