import 'package:flutter/material.dart';

class MyPassTextFField extends StatelessWidget {
  const MyPassTextFField(
      {super.key,
      required this.obsText,
      required this.validator,
      required this.name,
      required this.onTap,
      required this.onchanged});

  final bool obsText;
  final String Function(String?) validator;
  final String Function(String?) onchanged;
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsText,
      decoration: InputDecoration(
        hintText: name,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obsText ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        hintStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(),
      ),
      validator: validator,
      onChanged: onchanged,
    );
  }
}
