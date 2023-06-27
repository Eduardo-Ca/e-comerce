import 'package:flutter/material.dart';

class CategoriaCard extends StatelessWidget {
  final String categoria;
  final String selecionado;

  const CategoriaCard({super.key,required this.categoria,required this.selecionado});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Card(
        color:selecionado == categoria ?Colors.orangeAccent : Colors.white,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.orange,
            ),
            borderRadius: BorderRadius.circular(10.0)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(child: Text(categoria.toUpperCase(),style:  TextStyle(color:selecionado == categoria ? Colors.white :Colors.black,fontSize: 18, fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}
