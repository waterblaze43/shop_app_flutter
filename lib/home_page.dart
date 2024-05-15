import "package:flutter/material.dart";
import "package:shop_app_flutter/global_variables.dart";
import "package:shop_app_flutter/product_card.dart";
import "package:shop_app_flutter/product_details_page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ["All", "Adidas", "Nike", "Bata"];
  late String selectedFilter;
  late bool cookie;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
    cookie = false;
  }

  @override
  Widget build(BuildContext context) {
    const border = BorderSide(
      width: 2,
      style: BorderStyle.solid,
      color: Color.fromARGB(255, 163, 162, 162),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                        border:
                            Border(top: border, bottom: border, left: border),
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(50))),
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25,
                        ),
                        hintText: "Search",
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 53, 52, 52)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              //width: 60,
              height: 120,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = filters[index];
                            cookie = false;
                          });
                        },
                        onLongPress: () {
                          setState(() {
                            if (index == 2) {
                              cookie = true;
                            }
                          });
                        },
                        child: Chip(
                          label: Text(
                            filter,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15,
                          ),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(30),
                                right: Radius.circular(30)),
                          ),
                          side: const BorderSide(
                              color: Color.fromRGBO(245, 247, 249, 1)),
                          backgroundColor: filter == selectedFilter
                              ? Theme.of(context).colorScheme.primary
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      ),
                    );
                  }),
            ),
            cookie
                ? const Text("Developer")
                : Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.antiAlias,
                      itemBuilder: (context, index) {
                        final Map<String, dynamic> product = products[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductDetailsPage(
                                      product: product as Map<String, Object>);
                                },
                              ),
                            );
                          },
                          child: ProductCard(
                            title: product["title"],
                            price: product["price"],
                            image: product["imageUrl"],
                            cardColor: index.isEven
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 249, 1),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
