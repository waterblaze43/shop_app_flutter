import "package:flutter/material.dart";
import "package:shop_app_flutter/cart_page.dart";
import "package:shop_app_flutter/product_list.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const ProductList(),
      const CartPage(),
    ];
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        enableFeedback: true,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_checkout), label: ""),
        ],
      ),
    );
  }
}
