import 'package:ecomerce/modules/core/utils/compartilhados/skeleton.dart';
import 'package:ecomerce/modules/core/utils/constants/imagens_constantes.dart';
import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:ecomerce/modules/vendas/presenter/components/card_carrinho.dart';
import 'package:ecomerce/modules/vendas/presenter/components/detalhe_miniatura_produto.dart';
import 'package:ecomerce/stores/venda_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CarrinhoTela extends StatefulWidget {
  const CarrinhoTela({super.key});

  @override
  State<CarrinhoTela> createState() => _CarrinhoTelaState();
}

class _CarrinhoTelaState extends State<CarrinhoTela> {

  late VendaStore store;

  @override
  void didChangeDependencies() {
    store = Provider.of<VendaStore>(context);
    store.calcularTotal();
    super.didChangeDependencies();
  }

  Future<void> _refresh()async{
    store.calcularTotal();
    setState(() {});
    return await Future.delayed(const Duration(milliseconds: 25));
   

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation:0 ,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(top: 20.0),
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
      bottomNavigationBar: Row( children:[total(),comprar(),],),
      body:_listaDeProdutos());
  }

  _listaDeProdutos(){
    return Observer(builder: (context) {     
       return store.carrinho.products.isEmpty?
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
           children: [
            Center(
              child: SizedBox(
                width:260,
                child: Lottie.network(
                  ImagensConstantes.CARRINHO     
                ),
              ),
            ),
             const Text(MensagensConstantes.SEM_PRODUTOS,style: TextStyle(color: Colors.grey,fontSize: 32),),
           ],
         )
       :LiquidPullToRefresh(
        onRefresh:_refresh,	
        backgroundColor: Colors.amberAccent,
        color:  Colors.orange,
        height: 140,
        showChildOpacityTransition: false,
        child: ListView.builder(
           //controller: ScrollController(),
           shrinkWrap: true,
           itemCount: store.carrinho.products.length,                       //store.carrinho[0].products.length,
           itemBuilder: (context, index) {
             var item =  store.carrinho.products[index];                //store.carrinho[0].products[index];
             return  Dismissible(
                 background: Container(
                   color: Colors.orange,
                 ),
                 key: ValueKey<int>(store.carrinho.products.length),
                 onDismissed: (DismissDirection direction) {
                   setState(() {
                     store.removerProdutosCarrinho(produto:item);
                   });
                 },
             child: ListTile(
                 //!=== Card ===
                 title:Row(
                   children: [
                     CardCarrinho(produto: item,),
                     Row(children: [
                       Column(
                        children: [
                          IconButton(onPressed: (){
                            item.quantity += 1;  
                            store.calcularTotal();   
                            setState(() {});                      
                          }, icon: const Icon(Icons.add_circle,size: 24,color:Colors.orange)),
                          IconButton(onPressed: (){
                              if (item.quantity == 1){
                                null;
                              }else{
                                item.quantity -= 1;                            
                                store.calcularTotal(); 
                                setState(() {});
                              }
                          }, icon: Icon(Icons.remove_circle,size: 24,color: item.quantity == 1? Colors.grey:Colors.orange )),
                        ],
                      ),
                      Container(color: Colors.orange,height: 50,width: 2,)
                     ],)
                   ],
                 ),
                 onTap: (() {
                   detalhesMiniaturaProduto(context,item);
                   setState(() {});
                 }),
               ),
             );
           },
           ),
       );
    });
  }

  total() {
    return SizedBox(
      height: 70,
      width:MediaQuery.of(context).size.width/2,
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
          child:store.carrinho.products.isEmpty 
          ? const Text("Total: R\$0.00", style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold, fontSize: 22)) 
          : Text("Total: R\$${store.carrinho.total},00", style: const TextStyle(color:Colors.white,fontWeight: FontWeight.bold, fontSize: 22),),
        ),
      ),
    );
  }

  comprar() {
    return SizedBox(
      height: 70,
      width:MediaQuery.of(context).size.width/2,
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
