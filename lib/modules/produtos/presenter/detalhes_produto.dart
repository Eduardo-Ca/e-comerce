// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';
import 'package:flutter/material.dart';

class ProdutoDetalhes extends StatefulWidget {
  ProductsModel item;
  ProdutoDetalhes({super.key, required this.item});

  @override
  State<ProdutoDetalhes> createState() => _ProdutoDetalhesState();
}

class _ProdutoDetalhesState extends State<ProdutoDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.title!),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          carrosel(),
          descricao(),
          preco(),
          quantidade(),
          botaoAdicionarCarrinho()
        
        ]),
    );
  }

  botaoAdicionarCarrinho(){
    return  Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top:82.0),
        child: BottomAppBar(
          height: 20,
          elevation: 0,
          color: Colors.orange,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.shopping_cart,size: 32,color: Colors.black,),
              const Text("Add to Cart",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)
        ],),),
      ),
    );
  }
  quantidade(){
    return Padding(
      padding: const EdgeInsets.only(top:16.0),
      child: Center(
              child: Container(
                width: 250,
                height: 70,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black,
                ),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:14.0),
                      child: IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                    ),
                    Container(
                      width: 100,
                      height: 70,
                      color: Colors.white,
                      child: const Center(child: Text("1",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),
                    ), 
                    Padding(
                      padding: const EdgeInsets.only(right:14.0),
                      child: IconButton(onPressed: (){}, icon: const Icon(Icons.remove)),
                    ),
                ]),
              ),
            ),
    );
  }

  descricao(){
    return  Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(child: Text(widget.item.description!,style: const TextStyle(fontSize: 19,color: Colors.grey),)),
                IconButton(onPressed: (){}, icon: const Icon(Icons.share,size: 35,))
              ],
            ),
          );
  }

  preco(){
    return  Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text("R\$${widget.item.price!}",style: const TextStyle(color: Colors.orange, fontSize: 23),),
          );
  }

  carrosel() {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 300,
        autoPlay: true,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height
      ),
      itemCount: widget.item.images!.length,
      // ignore: non_constant_identifier_names
      itemBuilder: (BuildContext context, int Index, int pageViewIndex) =>
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red.withOpacity(0.2),),   
              color: Colors.red.withOpacity(0.1),
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
    );
  }
}
