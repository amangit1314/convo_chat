import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;
  final bool isPass;
  final TextInputType textInputType;
  final Icon preIcon;
  final Widget? suffixicon;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final double? contentPadding;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    this.suffixicon,
    this.isPass = false,
    required this.textInputType,
    this.preIcon = const Icon(Icons.email),
    this.onChanged,
    this.validator,
    this.onSaved,
    this.contentPadding = 15.0,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(12),
    );
    return TextFormField(
      style: const TextStyle(fontSize: 14),
      controller: textEditingController,
      decoration: InputDecoration(
        border: inputBorder,
        focusedBorder: inputBorder,
        hintText: hintText,
        suffixIcon: suffixicon,
        enabledBorder: inputBorder,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        filled: true,
        fillColor: Colors.white,
        labelText: labelText,
        prefixIcon: preIcon,
        contentPadding: EdgeInsets.all(contentPadding!),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
