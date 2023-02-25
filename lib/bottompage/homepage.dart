import 'package:flutter/material.dart';
import 'package:my_ecom_app/utils/myconst.dart';
import 'package:my_ecom_app/widgets/header.dart';

import '../widgets/chatpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "Conversations",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SizedBox(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: Flexible(
                  child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                        hintText: "Search"),
                  ),
                ),
              )),
            ),
            Container(
              height: 100,
              color: Colors.white,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: onlineList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage(onlineList[index]['img']),
                                  ),
                                  Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: CircleAvatar(
                                        radius: 5,
                                        backgroundColor:
                                            onlineList[index]['online'] == 1
                                                ? Colors.green
                                                : Colors.grey,
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(onlineList[index]['name'])
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: const ChatPage(),
              ),
            )
          ],
        ),
      )),
    );
  }
}
