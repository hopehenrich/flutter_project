import 'package:flutter/material.dart';
import 'package:my_ecom_app/chatapp/utils.dart';
import 'package:my_ecom_app/model/messsage_model.dart';

import '../widgets/header.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
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

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        key: scaffoldKey,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SafeArea(
              child: SizedBox(
            width: width,
            height: height,
            child: Column(
              children: [
                Header(height: height),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: allChats.length,
                      itemBuilder: (context, index) {
                        final allChat = allChats[index];
                        return SizedBox(
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width / 1.2,
                                child: listyle(
                                  allChat.avatar,
                                  allChat.sender.name,
                                  allChat.sender.othername,
                                  allChat.text.toString(),
                                ),
                              ),
                              SizedBox(
                                width: width - width / 1.2,
                                child: Column(
                                  children: [
                                    allChat.unreadCount == 0
                                        ? const Icon(Icons.done_all)
                                        : CircleAvatar(
                                            backgroundColor:
                                                const Color(0xff5E2B9F),
                                            foregroundColor: Colors.white,
                                            radius: 15,
                                            child: Text(
                                              allChat.unreadCount.toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      allChat.time,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    )
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
          )),
        ));
  }
}
