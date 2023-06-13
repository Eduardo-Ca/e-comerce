import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:ecomerce/modules/produtos/data/models/produto_model.dart';
import 'package:flutter/material.dart';


Future<String?> detalhesMiniaturaProduto(BuildContext context, ProductsModel produto) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
       
        content:AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            "${produto.title!}\nCategory:${produto.category}\n\n${produto.description!}",
            textAlign: TextAlign.center,
            textStyle: const TextStyle(
              fontSize: 17.0,
              color: Colors.black
            ),
            speed: const Duration(milliseconds: 50),
          ),
        ],
        totalRepeatCount: 1,
        pause: const Duration(milliseconds: 10),
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
          ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(MensagensConstantes.SAIR),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
