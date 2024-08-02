import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:projet_07_02/widgets/AddToCart/Provider/Cart.dart';
import 'package:projet_07_02/widgets/AddToCart/views/CheckOut.dart';
import '../Models/Item.dart';

final List<Item> items = [
  Item(
    name: "Smartphone SAMSUNG GALAXY S24 8Go 256Go - Violet",
    descrption: "En stock - samsung - Référence SM-S921-VIOLET",
    price: 3699.000,
    url:
        "https://i0.wp.com/navicom.tn/wp-content/uploads/2024/04/samsung-galaxy-s23-fe-sm-s711b-violet-8-go-256-go.webp?fit=1600%2C1600&ssl=1",
  ),
  Item(
      name: "NOVA 12i HUAWEI | 40 W  SuperCharge Turbo2 | 256 GB Large Storage",
      descrption: "En stock - HUAWEI - Référence YHSLEH",
      price: 3850.000,
      url:
          "https://consumer.huawei.com/content/dam/huawei-cbg-site/common/mkt/plp/phones-20230509/nova-series/nova12-i.png"),
  Item(
      name: "Galaxy S24+ 5G 256 GB Marble Gray Dual SIM",
      descrption: "En stock - samsung - Référence DFSDF-DFS",
      price: 4599.000,
      url:
          "https://assets.mmsrg.com/isr/166325/c1/-/ASSET_MMS_138721275?x=536&y=402&format=jpg&quality=80&sp=yes&strip=yes&trim&ex=536&ey=402&align=center&resizesource&unsharp=1.5x1+0.7+0.02&cox=0&coy=0&cdx=536&cdy=402"),
  Item(
      name: "Smartphone HUAWEI Nova 11 8Go 256Go - Vert",
      descrption: "En stock - samsung - Référence ZADRFS",
      price: 2199.000,
      url:
          "https://allsport.mu/cdn/shop/products/huawei-nova-11-pro-green.webp?v=1692685157"),
  Item(
      name: "Smartphone SAMSUNG Galaxy Z Flip 5 8Go 256Go - Rose Clair",
      descrption: "Sur commande 48h - samsung - Référence ZFLIP5-LPINK",
      price: 4599.000,
      url:
          "https://www.mielectro.es/rep/0893/2578318040/215/smartphone-samsung-z-flip-5-5g-8256-67quot-lavanda.jpg")
];

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 154, 191, 255),
      appBar: AppBar(
        title: Text("Phone shop"),
        backgroundColor: const Color.fromARGB(255, 154, 191, 255),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CheckOut();
                }));
              },
              icon: const Icon(
                Icons.add_shopping_cart_rounded,
                color: Colors.white,
              )),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Consumer<CartModel>(
              builder: (context, cart, child) {
                return Text(
                  "${cart.count}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return Card(
              child: Consumer<CartModel>(
                builder: (context, cart, child) {
                  return ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(25.0), // Add rounded corners
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 200,
                                maxHeight: 200,
                              ),
                              child: Image.network(
                                items[i].url,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${items[i].name}"),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Center(
                                          child: Text(
                                    "${items[i].price} DT",
                                    style: TextStyle(
                                        color: const Color.fromARGB(255, 188, 87, 80),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ))),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 154, 191, 255),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: IconButton(
                                        color: Colors.white,
                                        onPressed: () {
                                          cart.add(items[i]);
                                        },
                                        icon: Icon(Icons.add),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
