import 'package:ecomerce/modules/core/utils/compartilhados/home_appbar.dart';
import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BemVindoTela extends StatelessWidget {
  const BemVindoTela({super.key});

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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
              MensagensConstantes.LOJA_DO_SONHOS,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 150,
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
