import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {super.key,
      required this.validator,
      required this.name,
      required this.onchanged});

  final String Function(String?) validator;
  final String Function(String?) onchanged;
  final String name;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: name,
        hintStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      onChanged: onchanged,
    );
  }
}
