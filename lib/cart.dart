import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  final int burgerQuantity;

  const Cart({
    super.key,
    this.burgerQuantity = 2,
  });

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late int burgerQuantity;
  int pizzaQuantity = 1;

  final double burgerPrice = 120;
  final double pizzaPrice = 150;
  final double delivery = 30;

  bool orderPlaced = false;

  @override
  void initState() {
    super.initState();
    burgerQuantity = widget.burgerQuantity;
  }

  double get subtotal {
    return (burgerPrice * burgerQuantity) +
        (pizzaPrice * pizzaQuantity);
  }

  double get total {
    return subtotal + delivery;
  }

  void decreaseBurger() {
    if (burgerQuantity > 0) {
      setState(() {
        burgerQuantity--;
      });
    }
  }

  void increaseBurger() {
    setState(() {
      burgerQuantity++;
    });
  }

  void decreasePizza() {
    if (pizzaQuantity > 0) {
      setState(() {
        pizzaQuantity--;
      });
    }
  }

  void increasePizza() {
    setState(() {
      pizzaQuantity++;
    });
  }

  void deleteAll() {
    setState(() {
      burgerQuantity = 0;
      pizzaQuantity = 0;
    });
  }

  void placeOrder() {
    setState(() {
      orderPlaced = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff172235),
            size: 28,
          ),
        ),
        title: const Text(
          "My Cart",
          style: TextStyle(
            color: Color(0xff172235),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: deleteAll,
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
              size: 28,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    productItem(
                      imageUrl:
                          "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
                      name: "Classic Burger",
                      price: burgerPrice,
                      quantity: burgerQuantity,
                      minus: decreaseBurger,
                      plus: increaseBurger,
                    ),
                    const Divider(
                      color: Color(0xffeeeeee),
                      thickness: 1,
                    ),
                    productItem(
                      imageUrl:
                          "https://images.unsplash.com/photo-1574071318508-1cdbab80d002",
                      name: "Margherita Pizza",
                      price: pizzaPrice,
                      quantity: pizzaQuantity,
                      minus: decreasePizza,
                      plus: increasePizza,
                    ),
                    const Divider(
                      color: Color(0xffeeeeee),
                      thickness: 1,
                    ),
                    const SizedBox(height: 12),
                    summaryRow(
                      "Subtotal",
                      "${subtotal.toInt()} EGP",
                    ),
                    const SizedBox(height: 10),
                    summaryRow(
                      "Delivery",
                      "${delivery.toInt()} EGP",
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff172235),
                          ),
                        ),
                        Text(
                          "${total.toInt()} EGP",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton.icon(
                        onPressed: placeOrder,
                        icon: const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                        label: const Text(
                          "Place Order",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(22),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (orderPlaced) successCard(),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productItem({
    required String imageUrl,
    required String name,
    required double price,
    required int quantity,
    required VoidCallback minus,
    required VoidCallback plus,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.network(
              imageUrl,
              width: 105,
              height: 105,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) {
                return Container(
                  width: 105,
                  height: 105,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius:
                        BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.fastfood,
                    color: Colors.orange,
                    size: 45,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff172235),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "${price.toInt()} EGP",
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color(0xfff7f8fa),
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: minus,
                        icon: const Icon(
                          Icons.remove,
                          size: 19,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(width: 13),
                    Text(
                      "$quantity",
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 13),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color(0xfff7f8fa),
                        borderRadius:
                            BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: plus,
                        icon: const Icon(
                          Icons.add,
                          size: 19,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            "${(price * quantity).toInt()} EGP",
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget summaryRow(
    String title,
    String value,
  ) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xff172235),
          ),
        ),
      ],
    );
  }

  Widget successCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xffeeeeee),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.08),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xff2dbb72),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 38,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Order Placed Successfully",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff2dbb72),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Thank you for your order!",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  orderPlaced = false;
                });
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Color(0xffffb38b),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(13),
                ),
              ),
              child: const Text(
                "Back",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}