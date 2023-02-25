import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecom_app/chatapp/dashboard.dart';
import 'package:my_ecom_app/chatapp/inscription.dart';
import 'package:my_ecom_app/chatapp/textffield.dart';
import 'package:my_ecom_app/chatapp/utils.dart';

import 'button.dart';
import 'changescreen.dart';
import 'clip.dart';
import 'mypass.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final keyForm = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool obsText = true;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Stack(
            children: [
              ClipPath(
                clipper: Clipper(),
                child: clipping(width, height / 1.7 + 50, height / 10),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 20.0, right: 20.0, top: height / 5),
                height: height / 1.8,
                child: Card(
                    color: Colors.white,
                    child: SizedBox(
                      width: width,
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Text(
                              "Connexion",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Form(
                              key: keyForm,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: MyTextfField(
                                        controller: emailController,
                                        validator: (value) =>
                                            validatioEmail(value!),
                                        name: "Email",
                                        kboardtype: TextInputType.name),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: PassTextFField(
                                      obsText: obsText,
                                      validator: (value) =>
                                          validationPass(value!),
                                      name: "PassWord",
                                      onTap: () {
                                        setState(() {
                                          obsText = !obsText;
                                          FocusScope.of(context).unfocus();
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "Mot de passe oublié ?",
                                            style: TextStyle(
                                                color: Color(0xff5E2B9F),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height / 7,
                                  ),
                                  MyButtons(
                                      onPressed: () {
                                        Get.to(const DashBoard());
                                      },
                                      name: "Inscription")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: height / 1.2),
                child: ChangeScrens(
                    name: "Sinup",
                    onTap: () {
                      Get.to(const Inscription());
                    },
                    whichAccount: "Vous n'avez pas un conpte"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
