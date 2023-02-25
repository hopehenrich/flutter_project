import 'package:flutter/material.dart';

import '../utils/temp.dart';

class Slite extends StatefulWidget {
  const Slite({super.key});

  @override
  State<Slite> createState() => _SliteState();
}

class _SliteState extends State<Slite> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String name = "";
  String phone = "";
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
              children: [
                const Center(
                  child: Text(
                    'Ajouter un contact',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
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
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: const InputDecoration(
                      labelText: "Phone",
                      hintText: "Veuillez entrer votre numéro de télephone",
                      icon: Icon(Icons.phone)),
                  validator: (value) =>
                      value!.isEmpty ? "Ce champ est obligatoire" : null,
                  onChanged: (value) => phone = value,
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () async {
                      
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
          ),
        ),
      ),
    );
  }
}
