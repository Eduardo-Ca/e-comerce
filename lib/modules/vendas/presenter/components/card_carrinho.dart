import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';
import 'package:flutter/material.dart';

class CardCarrinho extends StatefulWidget {
  ProductsModel produto;
  CardCarrinho({super.key,required this.produto});

  @override
  State<CardCarrinho> createState() => _CardCarrinhoState();
}

class _CardCarrinhoState extends State<CardCarrinho> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: SizedBox(
              height: 90,
              width: 70,
              child: Image.network(
                widget.produto.thumbnail!,
                fit: BoxFit.cover,
              ),
            )), 
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                  SizedBox(width:205,child: Text(widget.produto.title!,style: const TextStyle(fontSize: 17,),maxLines:1,overflow:TextOverflow.ellipsis,)),
                  Text("R\$${widget.produto.priceTotal.toString()},00",style: const TextStyle(color:Colors.grey,fontSize: 16,),),
                  Text("Quantity:${widget.produto.quantity.toString()}",style: const TextStyle(color:Colors.grey,fontSize: 16,),),             
                
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}
