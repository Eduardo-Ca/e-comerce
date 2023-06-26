import 'package:ecomerce/modules/core/utils/constants/mensagens_constantes.dart';
import 'package:flutter/material.dart';

class CampoDeRegistro extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const CampoDeRegistro({super.key,required this.hint,required this.controller,this.onChanged});


  @override
  State<CampoDeRegistro> createState() => _CampoDeRegistroState();
}

class _CampoDeRegistroState extends State<CampoDeRegistro> {

  bool validator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        width: 360,
        child: TextFormField(
          validator: (String? value) {
            if (validator(value)) {
              return MensagensConstantes.CAMPO_VAZIO;
            }
            return null;
          },
          controller:widget.controller,
          onChanged: widget.onChanged,
          enabled: true,
          decoration: InputDecoration(
            hintText: widget.hint,
            labelText: widget.hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(),
            ),
          ),
        ),
      ),
    );
  }
}
