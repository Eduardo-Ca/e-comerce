// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';
import 'package:ecomerce/modules/produtos/domain/usecases/produto_usecase.dart';
import 'package:ecomerce/stores/produto_store.dart';
import 'package:ecomerce/stores/venda_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProdutoDetalhes extends StatefulWidget {
  ProductsModel item;
  ProdutoDetalhes({super.key, required this.item});

  @override
  State<ProdutoDetalhes> createState() => _ProdutoDetalhesState();
}

class _ProdutoDetalhesState extends State<ProdutoDetalhes> {
  late ProdutoStore store;
  late VendaStore vendaStore;
  late UseCasesProduto useCasesProduto;

  @override
  void didChangeDependencies() {
    vendaStore = Provider.of<VendaStore>(context);
    store = Provider.of<ProdutoStore>(context);
    store.quantidade = 1;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title!),
        actions: [
          IconButton(icon: widget.item.favorito?const Icon(Icons.star) :const Icon(Icons.star_border),
          onPressed: (){
            widget.item.favorito = !widget.item.favorito;

            if( widget.item.favorito == false){
              store.removerFavorito(widget.item);
            }else{
              store.salvarFavorito(widget.item);
            }

            setState(() {});
          },),
        ]
      ),
      bottomNavigationBar: _botaoAdicionarCarrinho(),
      body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _carrosel(),
          _descricao(),
          _preco(),
          _quantidade(),
        ]),
      ),
    );
  }

  _botaoAdicionarCarrinho() {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: GestureDetector(
          onTap: () {
            widget.item.quantity = store.quantidade;
            vendaStore.salvarProdutosCarrinho(produto: widget.item);
            Navigator.pop(context);
          },
          child: Card(
            shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.orange,
            ),
            borderRadius: BorderRadius.circular(10.0)),
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopping_cart,
                  size: 32,
                  color: Colors.black,
                ),
                const Text(
                  MensagensConstantes.ADICIONAR_NO_CARRINHO,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _quantidade() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Center(
        child: Container(
          width: 250,
          height: 70,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.black,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
             Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: IconButton(    
                color: store.quantidade == 1? Colors.grey : Colors.orange,            
                  onPressed: () {
                    store.quantidade > 1
                    ?store.quantidade -= 1
                    :null;
                    setState(() {});
                  },
                  icon: const Icon(Icons.remove)),
            ),
            Container(
              width: 100,
              height: 70,
              color: Colors.white,
              child: Center(child: Observer(builder: (_) {
                return Text(
                  store.quantidade.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22),
                );
              })),
            ),
           
             Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: IconButton(
                  onPressed: () {
                    store.quantidade += 1;
                    setState(() {});
                  },
                  icon: const Icon(Icons.add)),
            ),
          ]),
        ),
      ),
    );
  }

  _descricao() {
    return Padding(
      padding: const EdgeInsets.only(bottom:25.0,right: 12,left: 12),
      child: Row(
        children: [
          Expanded(
              child: Text(
            widget.item.description!,
            style: const TextStyle(fontSize: 19, color: Colors.grey),
          )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                size: 35,
              ))
        ],
      ),
    );
  }

  _preco() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "R\$${widget.item.price!},00",
            style: const TextStyle(color: Colors.orange, fontSize: 23),
          ),
        ),
        _total()
      ],
    );
  }

  _carrosel() {
    return Padding(
      padding: const EdgeInsets.only(bottom:35.0),
      child: CarouselSlider.builder(
        options: CarouselOptions(
            height: 300,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height),
        itemCount: widget.item.images!.length,
        // ignore: non_constant_identifier_names
        itemBuilder: (BuildContext context, int Index, int pageViewIndex) =>
            Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.orange.withOpacity(0.4),
              ),
              color: Colors.deepOrange.withOpacity(0.1),
            ),
            child: ListView(
              children: [
                Image.network(
                  widget.item.images![Index],
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _total(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Visibility(
        visible:store.quantidade > 1,
        child: Center(
          child: Card(
          color: Colors.orange,
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text( "Total: R\$${(widget.item.price!*store.quantidade).toString()},00"),
          ),
          ),
        ),
      ),
    );
  }
}
