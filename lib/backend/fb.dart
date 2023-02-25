import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.name,
            ),
            IconButton(
                onPressed: () {
                  final name = controller.text;

                  createUser(name: name);
                },
                icon: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }

  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final user = User(name, 21, docUser.id);
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String? id;
  String? name;
  int? age;

  User(this.name, this.age, this.id) {
    id = '';
    name;
    age;
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'age': age};
}
