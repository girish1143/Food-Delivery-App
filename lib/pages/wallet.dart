import 'package:flutter/material.dart';
import 'package:pro/widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade300, Colors.yellow.shade100], // Blue to light yellow gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    "Wallet",
                    style: AppWidget.headlineTextFeildStyle(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            // Wallet Balance Section with a Card-like design
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Row(
                  children: [
                    Image.asset(
                      "images/wallet.png",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Wallet",
                          style: AppWidget.LightTextFeildStyle(),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          "\₹100",
                          style: AppWidget.boldTextFeildStyle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            // Add Money Text Section
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Add Money",
                style: AppWidget.semiBoldTextFeildStyle(),
              ),
            ),
            const SizedBox(height: 10.0),
            // Add Money Options in a Row with Styled Containers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMoneyOption("\₹100"),
                _buildMoneyOption("\₹200"),
                _buildMoneyOption("\₹500"),
                _buildMoneyOption("\₹1000"),
              ],
            ),
            const SizedBox(height: 20.0),
            // Add Money Button
            Center(
              child: GestureDetector(
                onTap: () {
                  // Implement add money functionality
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF008080),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Add Money",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build money option buttons
  Widget _buildMoneyOption(String amount) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0XFFE9E2E2)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Text(
        amount,
        style: AppWidget.semiBoldTextFeildStyle(),
      ),
    );
  }
}
