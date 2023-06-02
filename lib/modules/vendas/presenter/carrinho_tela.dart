import 'package:ecomerce/modules/core/utils/compartilhados/skeleton.dart';
import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:ecomerce/modules/vendas/domain/usecases/venda_usecase.dart';
import 'package:ecomerce/stores/venda_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CarrinhoTela extends StatefulWidget {
  const CarrinhoTela({super.key});

  @override
  State<CarrinhoTela> createState() => _CarrinhoTelaState();
}

class _CarrinhoTelaState extends State<CarrinhoTela> {

  late UseCasesVenda useCasesVenda;
  late VendaStore store;

  @override
  void didChangeDependencies() {
    store = Provider.of<VendaStore>(context);
    store.carrinho.isEmpty
      ?store.obterCarrinho() 
      :null;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 28.0),
          child: Center(
              child: Text(
            MensagensConstantes.CARRINHO,
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
      body:SingleChildScrollView(
        child: Column(
          children: [

             _listaDeProdutos(),
             const SizedBox(height: 14,),
             Row(
              children: [
               total(), 
               comprar(),
             ],)
           
          ],
        ),
      )
    );
  }

  _listaDeProdutos(){
    return Observer(builder: (context) {
      if(store.vendaPendenteCarregando) {
        var larguraTela = MediaQuery.of(context).size.width;
        return SizedBox(height: 600,child:skeleton(80,larguraTela),);
       
      }
      else if (store.carrinho[0].products.isEmpty) {
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
          controller: ScrollController(),
          shrinkWrap: true,
          itemCount: store.carrinho[0].products.length,
          itemBuilder: (context, index) {
            var item = store.carrinho[0].products[index];
            return ListTile(
              //!=== Card ===
              title:Card(
                child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(item.title!,style: const TextStyle(fontSize: 19,),)),
                        Column(
                          children: [
                            const Icon(Icons.star,size: 28,),
                            Text("Quantity:${item.quantity!.toString()}",style: const TextStyle(color:Colors.grey,fontWeight: FontWeight.bold,fontSize: 18,),),
                          ],
                        ),
                      ],
                    ),
                    Text("R\$${item.price!.toString()},00",style: const TextStyle(color:Colors.grey,fontSize: 17,),),
                  ],
                ),
              ),),
              onTap: (() {
                
              }),
            );
          },
         
        );
      }
    });
  }

  total() {
    return SizedBox(
      height: 150,
      width:MediaQuery.of(context).size.width/2,
      child: Padding(
        padding: const EdgeInsets.only(top: 82.0),
        child: Container(

            decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xfff39060),
                Color(0xffffb56b),

              ],
            ),
           ),
          child: Center(
            child:store.carrinho.isEmpty 
            ? const Text("Total: R\$0.00", style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold, fontSize: 22)) 
            : Text("Total: R\$${store.carrinho[0].total}", style: const TextStyle(color:Colors.white,fontWeight: FontWeight.bold, fontSize: 22),),
          ),
        ),
      ),
    );
  }

  comprar() {
    return SizedBox(
      height: 150,
      width:MediaQuery.of(context).size.width/2,
      child: Padding(
        padding: const EdgeInsets.only(top: 82.0),
        child: Container(
           decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                 Color(0xffca485c),
                  Color(0xffe16b5c),
                  Color(0xfff39060),

              ],
            ),
           ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  const [
              Icon(
                Icons.shopping_cart,
                size: 32,
                color: Colors.white,
              ),
              Text(
                MensagensConstantes.COMPRAR,
                style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
              )
            ],
          ),
        ),
      ),
    );
  }

  skeleton(double heigth,double width){
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
          return Skeleton(heigth: heigth, width: width);
        },

      itemCount: 6,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 12,),
      );
  }
}
