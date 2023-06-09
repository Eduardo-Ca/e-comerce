import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecomerce/modules/core/utils/compartilhados/home_appbar.dart';
import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BemVindoTela extends StatefulWidget {
  const BemVindoTela({super.key});
  

  @override
  State<BemVindoTela> createState() => _BemVindoTelaState();
}

class _BemVindoTelaState extends State<BemVindoTela> {

  dynamic colorizeColors = [
    const Color.fromARGB(255, 255, 255, 255),
    const Color.fromARGB(255, 233, 170, 162),
    const Color.fromARGB(255, 212, 131, 90),
    const Color.fromARGB(255, 255, 106, 7),
  ];

  dynamic colorizeTextStyle = const TextStyle(
    fontSize: 30.0,
    fontFamily: 'Horizon',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              Color(0xffca485c),
              Color(0xffe16b5c),
              Color(0xfff39060),
              Color(0xffffb56b),
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Icon(
              Icons.shopping_bag,
              size: 140,
              color: Colors.white,
            )),
            Text(
              MensagensConstantes.FRG_COMMERCE,
              style: GoogleFonts.inconsolata(
                  color: Colors.white,
                  fontSize: 54,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 200.0,
              height: 150,
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  ColorizeAnimatedText(
                    MensagensConstantes.TEXTO_BEM_VINDO1,
                    textAlign: TextAlign.center,
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    MensagensConstantes.TEXTO_BEM_VINDO2,
                    textAlign: TextAlign.center,
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    MensagensConstantes.TEXTO_BEM_VINDO3,
                    textAlign: TextAlign.center,
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: true,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeAppBar()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.red)))),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    MensagensConstantes.COMECE_FAZER_COMPRAS,
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
