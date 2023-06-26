import 'package:ecomerce/modules/core/utils/constants/imagens_constantes.dart';
import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:ecomerce/modules/data/usuariodao.dart';
import 'package:ecomerce/modules/usuario/data/models/usuario_model.dart';
import 'package:ecomerce/modules/usuario/presenter/bem_vindo_tela/bem_vindo_tela.dart';
import 'package:ecomerce/modules/usuario/presenter/registro_conta_tela/components/campo_de_registro.dart';
import 'package:ecomerce/services/auth_service.dart';
import 'package:ecomerce/stores/formulario.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistroTela extends StatefulWidget {
  const RegistroTela({super.key});

  @override
  State<RegistroTela> createState() => _RegistroTelaState();
}

class _RegistroTelaState extends State<RegistroTela> {

  TextEditingController dataController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  

  final _formkey = GlobalKey<FormState>();
  final loginStore = formularioStore();
  bool chip1Selecionado = true;
  bool chip2Selecionado = false;

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(MensagensConstantes.CRIAR_CONTA,),
      ),
      bottomNavigationBar:  SizedBox(
       width: larguraTela,
        child: Image.asset(
         ImagensConstantes.REGISTRO_FUNDO,
         fit: BoxFit.fill,
                  ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:50.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CampoDeRegistro(hint: MensagensConstantes.USUARIO_NOME,controller: usernameController,),
                CampoDeRegistro(hint: MensagensConstantes.EMAIL,controller: emailController,onChanged: loginStore.setEmail,),
                CampoDeRegistro(hint: MensagensConstantes.SENHA,controller:senhaController,onChanged: loginStore.setPassword,),
                _formData(), 
                _genero(),
                _botaoConfirmar(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  _botaoConfirmar(){
    return Padding(
      padding: const EdgeInsets.only(top:25.0),
      child: SizedBox(
        width: 300,
            child: ElevatedButton(onPressed: (){
                if(loginStore.isFormValid){
                    if (_formkey.currentState!.validate()) {
                      loginStore.usuario = UsuarioModel(id: 0,username: usernameController.text,email: emailController.text,senha: senhaController.text,dataNascimento: dataController.text,genero: chip1Selecionado? "Male":"Female");
                      registrar(loginStore.usuario);
                       UsuarioDao().save(loginStore.usuario);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BemVindoTela()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('User: ${loginStore.usuario.username} created!',style: const TextStyle(fontSize: 18),),
                        ),
                      );    
                  }
                }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('The password must contain numbers and at least one uppercase letter.\nthe email must follow the example "example@gmail.com"',style: TextStyle(fontSize: 18),),
                        ),
                      );    
                  }
            }, child: const Text(MensagensConstantes.REGISTRAR,style: TextStyle(fontSize: 20,color: Colors.white),
          ),
        ),
      ),
    );
  }
  _formData() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        validator: (value) {
          if (valueValidator(value)) {
             return MensagensConstantes.SELECIONE_DATA;
          }else{
            return null;
          }
        },
        controller: dataController,
        decoration: InputDecoration(
           border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(),
            ),
          icon: const Icon(Icons.calendar_month),
          labelText: MensagensConstantes.DATA_NASCIMENTO,
          hintText: MensagensConstantes.SELECIONE_DATA,
        ),
        onTap: () async {
          DateTime? date = DateTime(1900);
          FocusScope.of(context).requestFocus(FocusNode());

          date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100)) ?? DateTime.now();

          dataController.text =date.toString().replaceRange(10, 23, "");
        },
      ),
    );
  }

    _genero() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(MensagensConstantes.SELECIONE_GENERO,style: TextStyle(fontSize: 20,color: Colors.grey),),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: ChoiceChip(
            backgroundColor: Colors.grey[700],
            label: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                MensagensConstantes.HOMEM,
                style: TextStyle(color: Colors.white),
              ),
            ),
            selected: chip1Selecionado,
            selectedColor: Colors.orange,
            onSelected: (newState) {
              setState(() {
                chip1Selecionado = newState;
                chip2Selecionado = false;
                
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: ChoiceChip(
            backgroundColor: Colors.grey[700],
            label: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(MensagensConstantes.MULHER, style: TextStyle(color: Colors.white)),
            ),
            selected: chip2Selecionado,
            selectedColor: Colors.orange,
            onSelected: (newState) {
              setState(() {
                chip2Selecionado = newState;
                chip1Selecionado = false;
              });
            },
          ),
        ),
      ],
    );
  }

   registrar(UsuarioModel usuario) async {
    try {
      await context.read<AuthService>().register(usuario.email,usuario.senha);
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.message)));
    }
  }
}
