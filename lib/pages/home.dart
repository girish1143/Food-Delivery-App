import 'package:flutter/material.dart';
import 'package:pro/pages/details.dart';
import 'package:pro/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false;
  bool pizza = false;
  bool burger = false;
  bool salad = false;

  void selectFood(String food) {
    setState(() {
      icecream = food == 'icecream';
      pizza = food == 'pizza';
      burger = food == 'burger';
      salad = food == 'salad';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,  // Set a subtle background color
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showItem(),
              const SizedBox(height: 30.0),
              SingleChildScrollView(  // Wrap the Row with SingleChildScrollView to prevent overflow
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Details()),
                        );
                      },
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 200,  // Keep fixed width
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 6.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  "images/salad1.jpg",
                                  height: 160,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                "Veggie Taco Hash",
                                style: AppWidget.semiBoldTextFeildStyle().copyWith(fontSize: 16),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "Fresh and Healthy",
                                style: AppWidget.LightTextFeildStyle().copyWith(fontSize: 14),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "\$25",
                                style: AppWidget.semiBoldTextFeildStyle().copyWith(fontSize: 18, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 200,  // Keep fixed width
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 6.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "images/salad1.jpg",
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Mix Veg Salad",
                              style: AppWidget.semiBoldTextFeildStyle().copyWith(fontSize: 16),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              "Spicy with Onion",
                              style: AppWidget.LightTextFeildStyle().copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              "\$28",
                              style: AppWidget.semiBoldTextFeildStyle().copyWith(fontSize: 18, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 200,  // Keep fixed width
                        margin: const EdgeInsets.all(4),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 6.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                "images/pizza.jpeg",
                                height: 160,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "Margherita Pizza",
                              style: AppWidget.semiBoldTextFeildStyle().copyWith(fontSize: 16),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              "Fresh Vegetables and Spicy",
                              style: AppWidget.LightTextFeildStyle().copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              "\$28",
                              style: AppWidget.semiBoldTextFeildStyle().copyWith(fontSize: 18, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            "images/ice2.jpeg",
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 30.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Soft Dessert",
                                style: AppWidget.semiBoldTextFeildStyle().copyWith(fontSize: 16),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "Dessert",
                                style: AppWidget.LightTextFeildStyle().copyWith(fontSize: 14),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                                "\$23",
                                style: AppWidget.semiBoldTextFeildStyle().copyWith(fontSize: 18, color: Colors.green),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hello Janni,",
              style: AppWidget.boldTextFeildStyle().copyWith(fontSize: 24),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 30.0),
        Text(
          "Delicious Food",
          style: AppWidget.headlineTextFeildStyle().copyWith(fontSize: 22),
        ),
        Text(
          "Discover and Get Great Food",
          style: AppWidget.LightTextFeildStyle().copyWith(fontSize: 16),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => selectFood('icecream'),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: icecream ? Colors.black38 : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    "images/icecream.jpeg",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => selectFood('pizza'),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: pizza ? Colors.black38 : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    "images/pizza.jpeg",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => selectFood('burger'),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: burger ? Colors.black38 : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    "images/burger.jpeg",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => selectFood('salad'),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: salad ? Colors.black38 : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Image.asset(
                    "images/salad.png",
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
