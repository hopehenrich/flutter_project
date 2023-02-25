import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_ecom_app/screens/login.dart';
import 'package:my_ecom_app/widgets/mybutton.dart';

import '../widgets/changesscreen.dart';
import '../widgets/mytextformfield.dart';
import '../widgets/passtextf.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final keyForm = GlobalKey<FormState>();
  final formKey = GlobalKey<ScaffoldState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final phoneController = TextEditingController();
  bool obsText = true;

  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  bool emailValid(String val) {
    return RegExp(p).hasMatch(val);
  }

  final snackbar = const SnackBar(content: Text("C'est valide"));

  String email = "";
  String password = "";
  String username = "";
  String phone = "";

  void validation() async {
    final form = keyForm.currentState;
    if (!form!.validate()) {
      try {
        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        // ignore: avoid_print
        print(credential.user!.uid);
      } on PlatformException catch (e) {
        // ignore: avoid_print
        print(e.message.toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: formKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: keyForm,
            child: Column(
              children: [
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 405,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MyTextFormField(
                        name: "UserName",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please fill Username";
                          } else if (value.length < 6) {
                            return "Username is too short";
                          }
                          return "";
                        },
                        onchanged: (value) {
                          setState(() {
                            username = value!;
                          });
                          return username;
                        },
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
                        onchanged: (value) {
                          setState(() {
                            email = value!;
                          });
                          return email;
                        },
                        name: "Email",
                      ),
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
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Phone number",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please fill phone number";
                          } else if (value.length < 8) {
                            return "Phone number must be is 8";
                          }
                          return null;
                        },
                      ),
                      MyButton(onPressed: validation, name: 'Register'),
                      const SizedBox(
                        height: 10,
                      ),
                      ChangeScren(
                          name: 'Login',
                          onTap: () => Get.to(const Login(),
                              transition: Transition.leftToRight,
                              duration: const Duration(seconds: 5)),
                          whichAccount: 'I have already an account'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
