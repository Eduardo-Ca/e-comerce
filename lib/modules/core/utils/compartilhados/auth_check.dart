import 'package:ecomerce/modules/usuario/presenter/login_tela/login_tela.dart';
import 'package:ecomerce/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    if(auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return const Login();
    } else {
      return const BottomAppBar();
    }
  }

  loading(){
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
