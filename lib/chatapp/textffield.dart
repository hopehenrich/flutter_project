import 'package:flutter/material.dart';
import 'package:my_ecom_app/chatapp/utils.dart';

// ignore: must_be_immutable
class MyTextfField extends StatelessWidget {
  MyTextfField(
      {super.key,
      required this.validator,
      required this.controller,
      required this.name,
      required this.kboardtype});

  final String Function(String?) validator;
  TextEditingController controller = TextEditingController();
  final TextInputType kboardtype;
  final String name;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: kboardtype,
      decoration: inputdecoration(name),
      validator: validator,
    );
  }
}
