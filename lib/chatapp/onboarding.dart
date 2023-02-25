import 'package:flutter/material.dart';
import 'package:my_ecom_app/json/constant.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff5E2B9F),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          height: 500,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/person-bg.png"),
                  fit: BoxFit.cover)),
        ),
        Expanded(
            child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Find Your Best \nFriend With Us",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "let's find your informaticien partner \nto enjoy and learn learn more",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xff5E2B9F),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Get Started",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width: (size.width - 100) / 5,
                        height: 10,
                        decoration: BoxDecoration(
                            color: const Color(0xff5E2B9F),
                            borderRadius: BorderRadius.circular(30))),
                  ],
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
