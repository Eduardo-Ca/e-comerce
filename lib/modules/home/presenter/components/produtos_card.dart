import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';
import 'package:flutter/material.dart';

class ProdutosCard extends StatefulWidget {
  ProductsModel produto;
  ProdutosCard({super.key, required this.produto});

  @override
  State<ProdutosCard> createState() => _ProdutosCardState();
}

class _ProdutosCardState extends State<ProdutosCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: SingleChildScrollView(
      child: Banner(
        message: "${widget.produto.discountPercentage}% off",
        location: BannerLocation.topEnd,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 150,
                  child: Image.network(
                    widget.produto.thumbnail!,
                    fit: BoxFit.cover,
                  ),
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
            estrelas(),
            LinearProgressIndicator(
              color: Colors.orange,
              value:
                  (widget.produto.rating! > 0) ? (widget.produto.rating! / 5) : 1,
            ),
          ],
        ),
      ),
    ));
  }

  estrelas() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "R\$${widget.produto.price!}",
            style: const TextStyle(color: Color(0xffca485c), fontSize: 16),
          ),
        ),
        SizedBox(width: 50,),
        Icon(Icons.star,
            size: 15,
            color: (widget.produto.rating! >= 1)
                ? Colors.orange
                : Colors.orange[100]),
        Icon(Icons.star,
            size: 15,
            color: (widget.produto.rating! >= 2)
                ? Colors.orange
                : Colors.orange[100]),
        Icon(Icons.star,
            size: 15,
            color: (widget.produto.rating! >= 3)
                ? Colors.orange
                : Colors.orange[100]),
        Icon(Icons.star,
            size: 15,
            color: (widget.produto.rating! >= 4)
                ? Colors.orange
                : Colors.orange[100]),
        Icon(Icons.star,
            size: 15,
            color: (widget.produto.rating! >= 5)
                ? Colors.orange
                : Colors.orange[100]),
      ],
    );
  }
}
