import 'package:flutter/material.dart';

// C'est la fonction responsable du quadraticbezier
clipping(double width, double height, double theight) {
  return Container(
    width: width,
    height: height,
    color: const Color(0xff5E2B9F),
    child: Column(
      children: [
        SizedBox(
          height: theight,
        ),
        const Text(
          "ChatApp",
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

// C'est l'input decoration destextformfields
inputdecoration(String name) {
  return InputDecoration(
      hintText: name,
      border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0, color: Color(0xff000000)),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2.0, color: Color(0xff5E2B9F)),
          borderRadius: BorderRadius.circular(10)));
}

// C'est la fonction validator des du premier textformfield
String validatioName(String value) {
  if (value.isEmpty) {
    return "Please fill Username";
  } else if (value.length < 6) {
    return "Username is too short";
  }
  return "";
}

// C'est la fonction validator des du second textformfield
String validatioFname(String value) {
  if (value.isEmpty) {
    return "Please fill Username";
  } else if (value.length < 6) {
    return "Username is too short";
  }
  return "";
}

// C'est la fonction validator des du troisieme textformfield

String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

bool emailValid(String val) {
  return RegExp(p).hasMatch(val);
}

String validatioEmail(String value) {
  if (value.isEmpty) {
    return "Please fill email";
  } else if (!emailValid(value)) {
    return "Email is invalid";
  }
  return "";
}

String validationPass(String value) {
  if (value.isEmpty) {
    return "Please fill password";
  } else if (value.length < 6) {
    return "Password is too short";
  }
  return "";
}

popupmenu() {
  return PopupMenuButton(
    itemBuilder: (context) => [
      PopupMenuItem(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Icon(Icons.settings),
          SizedBox(
            width: 5,
          ),
          Text(
            "Setting",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          )
        ],
      ))
    ],
  );
}

listyle(String image, String nom, String prenom, String message) {
  return ListTile(
    onTap: () {},
    leading: CircleAvatar(
      backgroundColor: const Color(0xff5E2B9F),
      foregroundColor: Colors.white,
      backgroundImage: AssetImage(image),
      radius: 30,
      child: Text(
        image.isEmpty ? nom[0] : "",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
    title: Text(
      "$nom $prenom",
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    ),
    subtitle: Text(
      message,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
    ),
  );
}

class Utilisateur {
  final String nom;
  final String prenom;
  final String image;
  final String message;

  Utilisateur(this.nom, this.prenom, this.image, this.message);
}
