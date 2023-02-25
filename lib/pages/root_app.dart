import 'package:flutter/material.dart';
import 'package:my_ecom_app/json/constant.dart';
import 'package:my_ecom_app/pages/account_page.dart';
import 'package:my_ecom_app/pages/cart_page.dart';
import 'package:my_ecom_app/pages/homepage.dart';
import 'package:my_ecom_app/pages/more_page.dart';
import 'package:my_ecom_app/pages/store_page.dart';
import 'package:my_ecom_app/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;
  AppBar? appbar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getFooter(),
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: const [
        HomePages(),
        StorePage(),
        AccountPage(),
        CartPage(),
        MorePage()
      ],
    );
  }

  getAppBar() {
    switch (activeTab) {
      case 0:
        appbar = null;
        break;
      case 1:
        appbar = null;
        break;
      case 2:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          centerTitle: true,
          title: const Text(
            "ACCOUNT",
            style: TextStyle(color: black),
          ),
        );
      case 3:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          centerTitle: true,
          title: const Text(
            "CART",
            style: TextStyle(color: black),
          ),
        );
      case 4:
        return AppBar(
          elevation: 0.8,
          backgroundColor: white,
          centerTitle: true,
          title: const Text(
            "MORE",
            style: TextStyle(color: black),
          ),
        );
      default:
    }
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: white,
          border: Border(top: BorderSide(color: grey.withOpacity(0.2)))),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              itemsTab.length,
              (index) => IconButton(
                  onPressed: () {
                    setState(() {
                      activeTab = index;
                    });
                  },
                  icon: Icon(
                    itemsTab[index]['icon'],
                    size: itemsTab[index]['size'],
                    color: activeTab == index ? accent : black,
                  ))),
        ),
      ),
    );
  }
}
