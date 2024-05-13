import "package:flutter/material.dart";

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
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
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
                              ? const Color.fromARGB(255, 238, 196, 32)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      ),
                    );
                  }),
            ),
            cookie
                ? const Text("Developer")
                : const Expanded(
                    child: Placeholder(),
                  ),
          ],
        ),
      ),
    );
  }
}
