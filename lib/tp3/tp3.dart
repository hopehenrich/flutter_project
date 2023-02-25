import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_ecom_app/utils/temp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared extends StatefulWidget {
  const Shared({super.key});

  @override
  State<Shared> createState() => _SharedState();
}

class _SharedState extends State<Shared> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController profController = TextEditingController();

  String name = "";
  String age = "";
  String proffession = "";

  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Titre de la page'),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Form(
          key: keyForm,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: "Name",
                    hintText: "Veuillez entrer votre nom",
                    icon: Icon(Icons.person)),
                validator: (value) =>
                    value!.isEmpty ? "Ce champ est obligatoire" : null,
                onChanged: (value) => name = value,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: ageController,
                decoration: const InputDecoration(
                    labelText: "Age",
                    hintText: "Veuillez entrer votre Age",
                    icon: Icon(Icons.person)),
                validator: (value) =>
                    value!.isEmpty ? "Ce champ est obligatoire" : null,
                onChanged: (value) => age = value,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: profController,
                decoration: const InputDecoration(
                    labelText: "Profession",
                    hintText: "Veuillez entrer votre profession",
                    icon: Icon(Icons.person)),
                validator: (value) =>
                    value!.isEmpty ? "Ce champ est obligatoire" : null,
                onChanged: (value) => proffession = value,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (keyForm.currentState!.validate()) {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString("name", nameController.text);
                      prefs.setString("age", ageController.text);
                      prefs.setString("proffession", profController.text);

                      Fluttertoast.showToast(
                          msg:
                              "Les informations ont été enrégistrées avec succes",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM);
                    }
                  },
                  child: const Text('Valider')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const InfoPage()));
                  },
                  child: const Text('Page suivante')),
            ],
          ),
        )),
      ),
    );
  }
}
