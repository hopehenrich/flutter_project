import 'package:flutter/material.dart';

import '../json/constant.dart';
import '../theme/colors.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  MorePageState createState() => MorePageState();
}

class MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage(profileUrl), fit: BoxFit.cover)),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: const [
                  Text(
                    "Daniel",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "4 Orders",
                    style: TextStyle(fontSize: 15, color: grey),
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Divider(
          color: grey.withOpacity(0.8),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(menusMore.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    menusMore[index],
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 23),
                  ),
                );
              })),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: (size.width - 100) / 2,
                height: 50,
                decoration: BoxDecoration(
                    color: black, borderRadius: BorderRadius.circular(30)),
                child: const Center(
                  child: Text(
                    "Settings",
                    style: TextStyle(fontSize: 15, color: white),
                  ),
                ),
              ),
              Container(
                width: (size.width - 100) / 2,
                height: 50,
                decoration: BoxDecoration(
                    color: black, borderRadius: BorderRadius.circular(30)),
                child: const Center(
                  child: Text(
                    "Sign Out",
                    style: TextStyle(fontSize: 15, color: white),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
