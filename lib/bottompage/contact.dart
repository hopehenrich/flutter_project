import 'package:flutter/material.dart';

import '../chatapp/utils.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final List<Utilisateur> liste = [
    Utilisateur("hope", "henrich", "images/userImage.png", "Slt ca va"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Slt ca va"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Slt ca va"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Slt ca va"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Slt ca va"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Slt ca va"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Slt ca va"),
    Utilisateur("hope", "henrich", "images/userImage.png", "Slt ca va"),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            children: [
              SizedBox(
                height: height / 5.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Contact",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Search Something",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
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
                              child: listyle(
                                  liste[index].image,
                                  liste[index].nom,
                                  liste[index].prenom,
                                  liste[index].message),
                            ),
                            SizedBox(
                              width: width - width / 1.2,
                              child: Row(
                                children: const [
                                  Icon(Icons.message),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(Icons.call)
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
