import 'package:flutter/material.dart';
import 'package:pro/widget/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,  // Background color set to match the previous screen
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10), // Added spacing
            Image.asset(
              "images/salad1.jpg",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mediterranean",
                      style: AppWidget.semiBoldTextFeildStyle(),
                    ),
                    Text(
                      "Chickpea Salad",
                      style: AppWidget.boldTextFeildStyle(),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (a > 1) {
                      --a;
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  a.toString(),
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    ++a;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              "In a bowl, mix canned chickpeas, diced cucumbers, halved cherry tomatoes, finely chopped red onion, and fresh parsley. Drizzle with olive oil and fresh lemon juice, then season with salt and pepper. Toss well and serve chilled or at room temperature.",
              maxLines: 3,
              style: AppWidget.LightTextFeildStyle(),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Text(
                  "Delivery Time",
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
                const SizedBox(
                  width: 5.0,
                ),
                const Icon(
                  Icons.alarm,
                  color: Colors.black54,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  "30 min",
                  style: AppWidget.semiBoldTextFeildStyle(),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: AppWidget.semiBoldTextFeildStyle(),
                      ),
                      Text(
                        "\$25", // Corrected the price format
                        style: AppWidget.boldTextFeildStyle(),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width / 2, // Fixed width calculation
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "Add to cart",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(width: 30.0),
                        Container( // Fixed typo 'Containr' to 'Container'
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
