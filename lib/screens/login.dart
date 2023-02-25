import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ecom_app/screens/signup.dart';
import 'package:my_ecom_app/widgets/changesscreen.dart';
import 'package:my_ecom_app/widgets/mybutton.dart';
import 'package:my_ecom_app/widgets/mytextformfield.dart';
import 'package:my_ecom_app/widgets/passtextf.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final keyForm = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool obsText = true;

  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  bool emailValid(String val) {
    return RegExp(p).hasMatch(val);
  }

  String email = "";
  String password = "";

  final snackbar = const SnackBar(content: Text("C'est valide"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 250,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 320,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    MyTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please fill email";
                          } else if (!emailValid(value)) {
                            return "Email is invalid";
                          }
                          return "";
                        },
                        name: "Email",
                        onchanged: (value) {
                          setState(() {
                            email = value!;
                          });
                          return email;
                        }),
                    MyPassTextFField(
                      obsText: obsText,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please fill password";
                        } else if (value.length < 6) {
                          return "Password is too short";
                        }
                        return "";
                      },
                      name: "Password",
                      onchanged: (value) {
                        setState(() {
                          password = value!;
                        });
                        return password;
                      },
                      onTap: () {
                        setState(() {
                          obsText = !obsText;
                          FocusScope.of(context).unfocus();
                        });
                      },
                    ),
                    MyButton(
                        onPressed: () async {
                          if (keyForm.currentState!.validate()) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email, password: password);
                              // ignore: avoid_print
                              print(credential.user!.email);
                            } catch (e) {
                              // ignore: avoid_print
                              print(e);
                            }
                          }
                        },
                        name: 'Login'),
                    const SizedBox(
                      height: 15,
                    ),
                    ChangeScren(
                        name: 'SignUp',
                        onTap: () => Get.to(const SignUp(),
                            transition: Transition.leftToRight,
                            duration: const Duration(milliseconds: 900)),
                        whichAccount: 'I have not an account'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
