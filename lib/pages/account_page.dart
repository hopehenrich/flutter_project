import 'package:flutter/material.dart';
import 'package:my_ecom_app/theme/colors.dart';

import '../json/constant.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage(profileUrl), fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Daniel",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Member since 2019",
                      style: TextStyle(
                          fontSize: 13, color: black.withOpacity(0.7)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Text(
                          "EDIT ACCOUNT",
                          style: TextStyle(fontSize: 13, color: white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(
                    Icons.shopping_bag,
                    color: black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Oders",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.location_on,
                    color: black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "My Address",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.settings,
                    color: black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: List.generate(
                accountList.length,
                (index) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              accountList[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: black.withOpacity(0.5),
                              size: 17,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Divider(
                          color: grey.withOpacity(0.8),
                        )
                      ],
                    )),
          ),
        )
      ],
    );
  }
}
