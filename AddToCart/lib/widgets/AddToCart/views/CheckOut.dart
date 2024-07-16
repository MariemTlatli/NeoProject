import 'package:flutter/material.dart';
import 'package:projet_07_02/widgets/AddToCart/Provider/Cart.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Total : "),
          backgroundColor: const Color.fromARGB(255, 154, 191, 255),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Consumer<CartModel>(
                builder: (context, cart, child) {
                  return Text(
                    "${cart.GetTotalPrice}",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
          ],
        ),
        body: Consumer<CartModel>(builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.GetMyList.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
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
                          constraints: BoxConstraints(
                            maxWidth: 200,
                            maxHeight: 200,
                          ),
                          child: Image.network(
                            cart.GetMyList[index].url,
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
                            child: Text("${cart.GetMyList[index].name}"),
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Center(
                                      child: Text(
                                "${cart.GetMyList[index].price} DT",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ))),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 154, 191, 255),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      cart.remove(cart.GetMyList[index]);
                                    },
                                    icon: Icon(Icons.remove),
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
              ));
            },
          );
        }));
  }
}
