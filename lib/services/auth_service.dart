import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception{
  String message;
  AuthException(this.message);
}
class AuthService extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = true;

  AuthService() {

    _authCheck();
  }

  _authCheck(){
    _auth.authStateChanges().listen((User? user) { 
        usuario = (user == null)? null : user;
        isLoading = false;
        notifyListeners();

    });
  }

  _getUser(){
    usuario = _auth.currentUser;
    notifyListeners();
  }

  register(String email,String senha)async{
    try {
      await _auth.createUserWithEmailAndPassword(email:email,password:senha) ;
      _getUser();
    } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      throw AuthException('weak password');
    }else if(e.code == 'email-already-in-use'){
      throw AuthException('Email already in use');
    }
  }
}

 login(String email,String senha)async{
    try {
      await _auth.signInWithEmailAndPassword(email:email,password:senha) ;
      _getUser();
    } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      throw AuthException('user not found');
    }else if(e.code == 'wrong-password'){
      throw AuthException('wrong password');
    }
  }
}

logout() async{
  await _auth.signOut();
  _getUser();
}

}
