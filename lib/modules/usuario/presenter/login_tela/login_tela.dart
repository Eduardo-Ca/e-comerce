import 'package:ecomerce/modules/core/utils/constants/imagens_constantes.dart';
import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:ecomerce/modules/usuario/presenter/bem_vindo_tela/bem_vindo_tela.dart';
import 'package:ecomerce/stores/formulario.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
  final login = formularioStore();

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: larguraTela,
                 child: Image.asset(
                  ImagensConstantes.LOGIN_FUNDO,
                  fit: BoxFit.fill,
                           ),
               ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 320,
                  child: TextFormField(
                    onChanged: login.setEmail,
                    enabled: true,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: MensagensConstantes.DIGITE_SEU_EMAIL,
                      labelText: MensagensConstantes.EMAIL,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 320,
                  child: TextFormField(
                    onChanged: login.SetPassword,
                    enabled: true,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.lock),
                      hintText: MensagensConstantes.DIGITE_SUA_SENHA,
                      labelText: MensagensConstantes.SENHA,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(bottom:7.2),
                child: const Text("Forgot your password?",style: TextStyle(color: Colors.orange),),
              ),
        
              Observer(builder: (_) {
                return SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      onPressed: login.isFormValid
                          ? () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BemVindoTela()));
                            }
                          : null,
                      child: const Text(MensagensConstantes.LOGIN)),
                );
              }),
        
        
               SizedBox(
                  width: 300,
                 child: ElevatedButton(
                      onPressed: () {} ,
                      child: const Text(MensagensConstantes.REGISTRAR)),
               ),
        
              SizedBox(
                width: larguraTela,
                 child: Image.asset(
                  ImagensConstantes.LOGIN_FUNDO_BAIXO,
                  fit: BoxFit.fill,
                           ),
               ),
           
            ],
          ),
        ),
      ),
    );
  }
}