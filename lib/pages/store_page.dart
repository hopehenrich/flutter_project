import 'package:flutter/material.dart';
import 'package:my_ecom_app/json/constant.dart';
import 'package:my_ecom_app/theme/colors.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  "Phnom Penh",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.location_on,
                  size: 20,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Find all \nstores here",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w400, height: 1.5),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Flexible(
                    child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextFormField(
                      cursorColor: primary,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search),
                          hintText: "Search"),
                    ),
                  ),
                )),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: black,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.location_on,
                      color: white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Divider(
            color: grey.withOpacity(0.8),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "All Stores",
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w400, color: black),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: List.generate(
                storeList.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(storeList[index]['img']),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Container(
                              height: 200,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: black.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        width: 65,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: storeList[index]['open'] == 0
                                            ? Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Text(
                                                    "CLOSE",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: black),
                                                  ),
                                                  Container(
                                                    width: 8,
                                                    height: 8,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Colors
                                                                .redAccent,
                                                            shape: BoxShape
                                                                .circle),
                                                  )
                                                ],
                                              )
                                            : Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  const Text(
                                                    "OPEN>",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: black),
                                                  ),
                                                  Container(
                                                    width: 8,
                                                    height: 8,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Colors.green,
                                                            shape: BoxShape
                                                                .circle),
                                                  )
                                                ],
                                              ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 20,
                                          color: white,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          storeList[index]['name'],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                              color: white),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
