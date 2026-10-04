import 'package:flutter/material.dart';
import 'BurgerDetails.dart';
import 'cart.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.orange,

        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Good Evening,",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            Text(
              "Ahmed 🍔",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Cart(),
                  ),
                );
              },

              child: CircleAvatar(
                backgroundColor: Colors.white24,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Search
              TextField(
                decoration: InputDecoration(
                  hintText: "Search food...",
                  prefixIcon: const Icon(Icons.search),

                  filled: true,
                  fillColor: Colors.grey.withOpacity(.1),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // Categories
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  category(
                    Icons.lunch_dining,
                    "Burger",
                  ),

                  category(
                    Icons.local_pizza,
                    "Pizza",
                  ),

                  category(
                    Icons.local_drink,
                    "Drinks",
                  ),

                  category(
                    Icons.icecream,
                    "Dessert",
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Popular Food",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              // Burger
              foodItem(
                context,
                "Classic Burger",
                "4.8",
                "120 EGP",
                Icons.lunch_dining,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const BurgerDetails(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 15),

              // Pizza
              foodItem(
                context,
                "Margherita Pizza",
                "4.7",
                "150 EGP",
                Icons.local_pizza,
                () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Category
  Widget category(
    IconData icon,
    String title,
  ) {
    return Column(
      children: [
        Container(
          height: 65,
          width: 65,

          decoration: BoxDecoration(
            color: Colors.orange.shade50,
            borderRadius: BorderRadius.circular(15),
          ),

          child: Icon(
            icon,
            color: Colors.orange,
            size: 32,
          ),
        ),

        const SizedBox(height: 8),

        Text(title),
      ],
    );
  }

  // Food Item
  Widget foodItem(
    BuildContext context,
    String name,
    String rating,
    String price,
    IconData icon,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 120,

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 8,
            ),
          ],
        ),

        child: Row(
          children: [

            Container(
              height: 120,
              width: 120,

              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Icon(
                icon,
                size: 70,
                color: Colors.orange,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    "⭐ $rating",
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 7),

                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.only(right: 10),

              child: CircleAvatar(
                backgroundColor: Colors.orange,

                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}