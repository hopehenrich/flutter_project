import 'package:flutter/material.dart';
import 'package:my_ecom_app/json/constant.dart';
import 'package:my_ecom_app/theme/colors.dart';
import 'package:my_ecom_app/widgets/custom_slider.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
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
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Container(
              width: size.width,
              height: 500,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(homeImg), fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.favorite,
                    color: white,
                    size: 28,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.search,
                    color: white,
                    size: 28,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Winter Collection",
                        style: TextStyle(
                            fontSize: 25,
                            color: white,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Text("DiSCOVER",
                            style: TextStyle(
                                fontSize: 15,
                                color: white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: white,
                          size: 16,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Categories",
                  style: TextStyle(
                      fontSize: 18, color: black, fontWeight: FontWeight.bold)),
              Row(
                children: const [
                  Text("All",
                      style: TextStyle(
                        color: grey,
                      )),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: grey,
                    size: 16,
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                categories.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        width: 180,
                        height: 220,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(categories[index]
                                              ['imgUrl']
                                          .toString()),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            Positioned(
                                bottom: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    categories[index]['title'].toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: white),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Recommended for you",
                  style: TextStyle(
                      fontSize: 18, color: black, fontWeight: FontWeight.bold)),
              Row(
                children: const [
                  Text("All",
                      style: TextStyle(
                        color: grey,
                      )),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: grey,
                    size: 16,
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                recommends.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 140,
                            height: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(
                                        recommends[index]['imgUrl'].toString()),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recommends[index]['title'].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: black,
                                      height: 1.5),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "\$ ${recommends[index]['price']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: grey,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const CustomeCarouselHomePage(items: slider),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Recently viewed",
                  style: TextStyle(
                      fontSize: 18, color: black, fontWeight: FontWeight.bold)),
              Row(
                children: const [
                  Text("All",
                      style: TextStyle(
                        color: grey,
                      )),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: grey,
                    size: 16,
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
                recently.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 140,
                            height: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: AssetImage(
                                        recently[index]['imgUrl'].toString()),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recently[index]['title'].toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: black,
                                      height: 1.5),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "\$ ${recently[index]['price']}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: grey,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
