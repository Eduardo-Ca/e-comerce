import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';
import 'package:flutter/material.dart';

class ProdutosCard extends StatefulWidget {
  ProductsModel produto;
  ProdutosCard(
      {super.key,
      required this.produto
      });

  @override
  State<ProdutosCard> createState() => _ProdutosCardState();
}

class _ProdutosCardState extends State<ProdutosCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              widget.produto.thumbnail!,
              fit: BoxFit.cover,
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
             widget.produto.title!,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
             widget.produto.description!,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
             "R\$${widget.produto.price!}",
            style: const TextStyle(color: Color(0xffca485c), fontSize: 16),
          ),
        )
      ],
    ));
  }
}
