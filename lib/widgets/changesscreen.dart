import 'package:flutter/material.dart';

class ChangeScren extends StatelessWidget {
  const ChangeScren(
      {super.key,
      required this.name,
      required this.onTap,
      required this.whichAccount});

  final String name;
  final VoidCallback onTap;
  final String whichAccount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          whichAccount,
          style: const TextStyle(fontSize: 17),
        ),
        const SizedBox(
          width: 15,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.cyan, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
