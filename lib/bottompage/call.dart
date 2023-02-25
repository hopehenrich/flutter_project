import 'package:flutter/material.dart';

import '../chatapp/utils.dart';

class Call extends StatefulWidget {
  const Call({super.key});

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  final List<Utilisateur> liste = [
    Utilisateur("hope", "henrich", "images/userImage.png", "Date"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Date"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Date"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Date"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Date"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Date"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Date"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Date"),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      width: width,
      height: height,
      child: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: height / 5.5,
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: const [
                  Text(
                    "Appels",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: height - (height / 5.5 + 115),
            child: ListView.builder(
                itemCount: liste.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width / 1.2,
                          child: listyle(liste[index].image, liste[index].nom,
                              liste[index].prenom, liste[index].message),
                        ),
                        SizedBox(
                            width: width - width / 1.2,
                            child: const Icon(Icons.call_sharp)),
                      ],
                    ),
                  );
                }),
          )
        ],
      )),
    ));
  }
}
