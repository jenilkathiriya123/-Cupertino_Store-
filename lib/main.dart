import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr_1_1/page/Global.dart';

void main() {
  runApp(
    CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: homepage(),
    ),
  );
}

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int indexpage = 0;
  DateTime date = DateTime.now();
  List<dynamic> month = [
    "Jan",
    "feb",
    "Mar",
    "April",
    "May",
    "Jun",
    "July",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          IndexedStack(
            index: indexpage,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          color: Color(0xfff9f9f9),
                          border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 2),
                          ),
                        ),
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          "Cupertino Store",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      ...Global.Productlist.map(
                        (e) => Container(
                          padding: EdgeInsets.only(top: 10),
                          height: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: 70,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.asset(
                                        e['images'],
                                        // fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(left: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${e['title']}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "${e['price']}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: GestureDetector(
                                        onTap: () {
                                          Global.name = e['title'];
                                          Global.image = e['images'];
                                          Global.price = e['price'];
                                          Global.price2 = e['price2'];
                                          setState(() {
                                            Map<String,dynamic> myList = {
                                              'title': Global.name,
                                              'image': Global.image,
                                              'price': Global.price,
                                              'price2': Global.price2,
                                            };
                                            Global.ItemList.addAll([myList]);
                                            Global.total = Global.total + int.parse(e['price']);

                                          });
                                        },
                                        child: const Icon(Icons.add_rounded)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      CupertinoSearchTextField(
                          placeholder: "Shirt", itemColor: Colors.grey),
                      ...Global.Search.map(
                        (e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(height: 30),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 70,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      e['images'],
                                      // fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(left: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${e['title']}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "${e['price']}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: GestureDetector(
                                      onTap: () {
                                        Global.name = e['title'];
                                        Global.image = e['images'];
                                        Global.price = e['price'];
                                        Global.price2 = e['price2'];
                                        setState(() {
                                          Map<String,dynamic> myList = {
                                            'title': Global.name,
                                            'image': Global.image,
                                            'price': Global.price,
                                            'price2': Global.price2,
                                          };
                                          Global.ItemList.addAll([myList]);
                                          Global.total = Global.total + int.parse(e['price']);

                                        });
                                      },
                                      child: Icon(Icons.add_rounded)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ).toList(),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: 135,
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          color: const Color(0xfff9f9f9),
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.shade300, width: 2),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 17, bottom: 10),
                        child: const Text(
                          "Shopping Cart",
                          style: TextStyle(
                            fontSize: 33,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        height: 170,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CupertinoTextField(
                              padding: const EdgeInsets.only(bottom: 10),
                              clearButtonMode: OverlayVisibilityMode.editing,
                              placeholder: "Name",
                              prefix: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 10),
                                child: Icon(Icons.person,
                                    color: Colors.grey.shade400, size: 30),
                              ),
                            ),
                            CupertinoTextField(
                              padding: const EdgeInsets.only(bottom: 10),
                              clearButtonMode: OverlayVisibilityMode.editing,
                              placeholder: "Email",
                              prefix: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 10),
                                child: Icon(Icons.email,
                                    color: Colors.grey.shade400, size: 30),
                              ),
                            ),
                            CupertinoTextField(
                              padding: const EdgeInsets.only(bottom: 10),
                              clearButtonMode: OverlayVisibilityMode.editing,
                              placeholder: "Location",
                              prefix: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 10),
                                child: Icon(Icons.location_on_sharp,
                                    color: Colors.grey.shade400, size: 30),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(Icons.watch_later_outlined,
                                  color: Colors.grey.shade400, size: 30),
                            ),
                            Text("Delivery Time",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade400)),
                            const Spacer(),
                            Text(
                              "${month[date.month - 1]} ${date.day}, ${date.year} ${date.hour}:${date.minute}",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.grey.shade500,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 140,
                        child: CupertinoDatePicker(
                          dateOrder: DatePickerDateOrder.dmy,
                          backgroundColor: Colors.white,
                          initialDateTime: DateTime.now(),
                          use24hFormat: false,
                          maximumYear: 2100,
                          minimumYear: 1900,
                          onDateTimeChanged: (dateTime) {
                            setState(() {
                              date = dateTime;
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      ...Global.ItemList.map(
                        (e) => Container(
                          padding: const EdgeInsets.only(top: 20),
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  height: 70,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image(
                                    image: AssetImage(e['image']),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${e['title']}",
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Text(
                                        "${e['price']}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.only(right: 15),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "${e['price2']}",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 150,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Shipping : ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: (Global.ItemList.isEmpty)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "\$ 19.32",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: (Global.ItemList.isEmpty)
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "\$ Tax : ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: (Global.ItemList.isEmpty)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "10.21",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: (Global.ItemList.isEmpty)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 1,
                                width: 100,
                                color: (Global.ItemList.isEmpty)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Total : ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: (Global.ItemList.isEmpty)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "\$ ${Global.total + 19.32 + 10.21}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: (Global.ItemList.isEmpty)
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          CupertinoTabBar(
            currentIndex: indexpage,
            onTap: (val) {
              setState(() {
                indexpage = val;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart),
                label: "Cart",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
