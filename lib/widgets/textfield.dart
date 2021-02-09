import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {

  final TextEditingController controller;
  final String hint;
  final Widget prefix, sufix;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final bool enabled, obscure;

  MyTextField(this.controller, this.hint, this.prefix, this.sufix,
      this.textInputType, this.onChanged, this.enabled, this.obscure);

  @override
  _MyTextFieldState createState() => _MyTextFieldState(this.controller, this.hint, this.prefix, this.sufix,
      this.textInputType, this.onChanged, this.enabled, this.obscure);
}

class _MyTextFieldState extends State<MyTextField> {

  final TextEditingController controller;
  final String hint;
  final Widget prefix, sufix;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final bool enabled, obscure;

  _MyTextFieldState(this.controller, this.hint, this.prefix, this.sufix,
      this.textInputType, this.onChanged, this.enabled, this.obscure);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.7,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(32),
        ),
        padding: prefix != null ? null : const EdgeInsets.only(left: 16),
        child: TextField(
          expands: false,
          controller: controller,
          obscureText: obscure,
          keyboardType: textInputType,
          onChanged: onChanged,
          enabled: enabled,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
            prefixIcon: prefix,
            suffixIcon: sufix,
          ),
        ),
      ),
    );
  }
}
