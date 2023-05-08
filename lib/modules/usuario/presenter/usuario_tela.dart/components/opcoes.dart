// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class opcoes extends StatefulWidget {
  String texto;
  void Function()? funcao;
   opcoes({super.key, required this.texto,required this.funcao});

  @override
  State<opcoes> createState() => _opcoesState();
}

class _opcoesState extends State<opcoes> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding:
            const EdgeInsets.only(top: 18.0, left: 12, right: 8, bottom: 12),
        child: GestureDetector(
          onTap: widget.funcao,
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(
                widget.texto,
                style: const TextStyle(fontSize: 25),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.black,
                size: 32,
              )
            ],
          ),
        ),
      ),
      const Divider(
        thickness: 1.6,
      ),
    ]);
  }
}
