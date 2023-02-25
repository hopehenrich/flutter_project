import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  String nom = "";

  String age = "";

  String prof = "";

  loadingInformation() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nom = prefs.getString("name") ?? "";
      nom = prefs.getString("age") ?? "";
      nom = prefs.getString("proffession") ?? "";
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadingInformation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Titre de la page'),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                const TextSpan(
                    text: "Nom: ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: nom)
              ]))
        ],
      ),
    );
  }
}
