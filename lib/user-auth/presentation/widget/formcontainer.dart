import 'package:flutter/material.dart';

class FormContainer extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldkey;
  final bool? isPasswordField;
  final String? hintext;
  final String? labeltext;
  final String? helpertext;
  final FormFieldSetter<String>? onsaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;

  const FormContainer(
      {this.controller,
      this.fieldkey,
      this.isPasswordField,
      this.hintext,
      this.labeltext,
      this.helpertext,
      this.onsaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType,
      super.key});

  @override
  State<FormContainer> createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.inputType,
        key: widget.fieldkey,
        obscureText: widget.isPasswordField == true? _obscureText : false,
        onSaved: widget.onsaved,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: widget.hintext,
          hintStyle: const TextStyle(color: Colors.black45),
          suffixIcon: GestureDetector(
            onTap: (){
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField == true? Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: _obscureText == false ? Colors.blue : Colors.grey,) : const Text("")
          )
        ),
      ),
    );
  }
}
