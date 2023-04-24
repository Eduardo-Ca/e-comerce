import 'package:flutter/material.dart';

class HomeCard extends StatefulWidget {
  String texto;
  IconData icone;
   void Function()? funcao;
  HomeCard(
      {super.key,
      required this.texto,
      required this.icone,
      required this.funcao});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 10),
      child: SizedBox(
        width: 140,
        height: 110,
        child: GestureDetector(
          onTap: widget.funcao,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icone,
                  size: 50,
                ),
                Text(widget.texto,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
