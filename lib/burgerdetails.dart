import 'package:flutter/material.dart';
import 'cart.dart';

class BurgerDetails extends StatefulWidget {
  const BurgerDetails({super.key});

  @override
  State<BurgerDetails> createState() =>
      _BurgerDetailsState();
}

class _BurgerDetailsState
    extends State<BurgerDetails> {

  int quantity = 2;

  final double price = 120;

  @override
  Widget build(BuildContext context) {

    double total = price * quantity;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              // Image
              Stack(
                children: [

                  SizedBox(
                    height: 300,
                    width: double.infinity,

                    child: Image.network(
                      "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Back
                  Positioned(
                    top: 15,
                    left: 15,

                    child: CircleAvatar(
                      backgroundColor:
                          Colors.black54,

                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // Favorite
                  Positioned(
                    top: 15,
                    right: 15,

                    child: CircleAvatar(
                      backgroundColor: Colors.white,

                      child: IconButton(
                        onPressed: () {},

                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    // Name + Price
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                      children: [

                        const Text(
                          "Classic Burger",

                          style: TextStyle(
                            fontSize: 26,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        Text(
                          "120 EGP",

                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight:
                                FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Row(
                      children: [

                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 22,
                        ),

                        SizedBox(width: 5),

                        Text(
                          "4.8 (120)",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "A delicious classic burger with beef, "
                      "cheese and fresh vegetables.",

                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 25),

                    const Text(
                      "Quantity",

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Quantity
                    Container(
                      height: 60,

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),

                        borderRadius:
                            BorderRadius.circular(15),
                      ),

                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                        children: [

                          IconButton(
                            onPressed: () {

                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }

                            },

                            icon: const Icon(
                              Icons.remove,
                              size: 28,
                            ),
                          ),

                          Text(
                            "$quantity",

                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },

                            icon: const Icon(
                              Icons.add,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Total
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                      children: [

                        const Text(
                          "Total",

                          style: TextStyle(
                            fontSize: 22,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        Text(
                          "${total.toInt()} EGP",

                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight:
                                FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 25),

                    // Add To Cart
                    SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton.icon(

                        onPressed: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (context) =>
                                  Cart(
                                burgerQuantity:
                                    quantity,
                              ),
                            ),
                          );

                        },

                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),

                        label: const Text(
                          "Add To Cart",

                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.orange,

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}