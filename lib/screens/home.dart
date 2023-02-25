import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget builCategorieProduct({required int color, required String image}) {
    return CircleAvatar(
      maxRadius: 32,
      backgroundColor: Color(color),
      child: SizedBox(
        height: 40,
        child: Image(image: AssetImage("images/$image")),
      ),
    );
  }

  Widget buildFeaturedProduct(
      {required String name, required double price, required String images}) {
    return Card(
      child: Container(
        height: 250,
        width: 150,
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              height: 170,
              width: 130,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/$images"))),
            ),
            Text(
              "\$ $price",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color(0xff9b96d6)),
            ),
            Text(
              name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color(0xff000000)),
            )
          ],
        ),
      ),
    );
  }

  final skey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: skey,
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text(
          "HomePage",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          onPressed: () {
            skey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.send),
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 120,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Search Something",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Featured",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "See All",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            buildFeaturedProduct(
                                name: "Man Long T-Shirt",
                                price: 30.0,
                                images: "women.jpg"),
                            buildFeaturedProduct(
                                name: "Man Long T-Shirt",
                                price: 30.0,
                                images: "women.jpg"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 70.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Categorie",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      builCategorieProduct(
                          color: 0xff33dcfd, image: "userImage.png"),
                      builCategorieProduct(
                          color: 0xfff38cdd, image: "userImage.png"),
                      builCategorieProduct(
                          color: 0xff4ff2af, image: "userImage.png"),
                      builCategorieProduct(
                          color: 0xff74acf7, image: "userImage.png"),
                      builCategorieProduct(
                          color: 0xfffc6c8d, image: "userImage.png")
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Featured",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        buildFeaturedProduct(
                            name: "Man Long T-Shirt",
                            price: 30.0,
                            images: "women.jpg"),
                        buildFeaturedProduct(
                            name: "Man Long T-Shirt",
                            price: 30.0,
                            images: "women.jpg"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
